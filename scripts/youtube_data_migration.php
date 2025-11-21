<?php
/**
 * YouTube Data Migration Script
 * Fetches video metadata from YouTube API and caches via MODX cache manager
 *
 * Version: 1.0 - Production Ready (after ChatGPT review)
 * Date: 2025-11-01
 *
 * IMPROVEMENTS V1.0:
 * - ✅ Uses MODX cache manager (not manual files)
 * - ✅ Secure credentials loading
 * - ✅ Exponential backoff for retries
 * - ✅ Detailed logging
 * - ✅ Validation before caching
 *
 * Usage:
 * ssh contabo
 * cd /var/www/mymetodica.com/scripts
 * php youtube_data_migration.php
 */

define('MODX_API_MODE', true);
require_once dirname(dirname(__FILE__)) . '/index.php';

$modx->getService('error','error.modError');
$modx->setLogLevel(modX::LOG_LEVEL_INFO);

echo "=== YouTube Data Migration Script ===\n";
echo "Start time: " . date('Y-m-d H:i:s') . "\n\n";

// ============================================================================
// 1. LOAD CONFIGURATION
// ============================================================================

$credentialsPath = MODX_BASE_PATH . 'config/youtube_credentials.php';

if (!file_exists($credentialsPath)) {
    echo "ERROR: YouTube credentials file not found: {$credentialsPath}\n";
    echo "Please create this file first. See config/youtube_credentials.php.template\n";
    exit(1);
}

$credentials = require $credentialsPath;

if (!$credentials['enabled']) {
    echo "ERROR: YouTube API is disabled in configuration\n";
    exit(1);
}

if (empty($credentials['api_key']) || $credentials['api_key'] === 'YOUR_YOUTUBE_API_KEY_HERE') {
    echo "ERROR: YouTube API key not configured\n";
    echo "Please edit {$credentialsPath} and set your API key\n";
    exit(1);
}

$apiKey = $credentials['api_key'];
$timeout = $credentials['timeout'];
$retryAttempts = $credentials['retry_attempts'];
$retryDelay = $credentials['retry_delay'];
$cacheLifetime = $credentials['cache_lifetime'];

echo "Configuration loaded:\n";
echo "- API timeout: {$timeout}s\n";
echo "- Retry attempts: {$retryAttempts}\n";
echo "- Cache lifetime: " . ($cacheLifetime / 3600) . " hours\n\n";

// ============================================================================
// 2. GET ALL VIDEO PAGES
// ============================================================================

$resources = $modx->getCollection('modResource', [
    'template' => 5, // Template "Видео"
    'published' => 1
]);

$totalCount = count($resources);
echo "Found {$totalCount} video pages to process\n\n";

if ($totalCount === 0) {
    echo "No video pages found. Exiting.\n";
    exit(0);
}

// ============================================================================
// 3. PROCESS EACH VIDEO
// ============================================================================

$successCount = 0;
$errorCount = 0;
$skippedCount = 0;
$errors = [];

foreach ($resources as $resource) {
    $resourceId = $resource->get('id');
    $pagetitle = $resource->get('pagetitle');
    $videoLink = $resource->getTVValue('video_link');

    echo "Processing [{$resourceId}] {$pagetitle}...\n";

    // Validate video_link exists
    if (empty($videoLink)) {
        echo "  ⚠️  SKIP: No video_link\n\n";
        $skippedCount++;
        $errors[] = "Resource {$resourceId}: No video_link";
        continue;
    }

    // Extract video ID
    preg_match('/(?:youtube\.com\/watch\?v=|youtu\.be\/)([a-zA-Z0-9_-]+)/', $videoLink, $matches);
    $videoId = $matches[1] ?? null;

    if (!$videoId) {
        echo "  ❌ ERROR: Invalid YouTube URL: {$videoLink}\n\n";
        $errorCount++;
        $errors[] = "Resource {$resourceId}: Invalid URL '{$videoLink}'";
        continue;
    }

    echo "  Video ID: {$videoId}\n";

    // Check if already cached
    $cacheKey = 'youtube/video_' . $videoId;
    $cacheOptions = [xPDO::OPT_CACHE_KEY => 'youtube_data'];

    $cached = $modx->cacheManager->get($cacheKey, $cacheOptions);

    if (!empty($cached) && !empty($cached['duration'])) {
        echo "  ✓  Already cached (duration: {$cached['duration']})\n\n";
        $successCount++;
        continue;
    }

    // Fetch from YouTube API with retry logic
    $apiUrl = 'https://www.googleapis.com/youtube/v3/videos?id=' . $videoId
            . '&part=contentDetails,snippet,statistics&key=' . $apiKey;

    $attempt = 0;
    $success = false;
    $videoData = null;

    while ($attempt < $retryAttempts && !$success) {
        $attempt++;

        if ($attempt > 1) {
            $delay = $retryDelay * pow(2, $attempt - 1); // Exponential backoff
            echo "  Retry attempt {$attempt} after {$delay}s...\n";
            sleep($delay);
        }

        $ch = curl_init($apiUrl);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
        curl_setopt($ch, CURLOPT_TIMEOUT, $timeout);
        curl_setopt($ch, CURLOPT_HEADER, false);

        $response = curl_exec($ch);
        $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
        $curlError = curl_error($ch);
        curl_close($ch);

        // Handle errors
        if ($response === false || !empty($curlError)) {
            echo "  ❌ cURL error (attempt {$attempt}): {$curlError}\n";
            if ($attempt >= $retryAttempts) {
                $errorCount++;
                $errors[] = "Resource {$resourceId}: cURL error - {$curlError}";
            }
            continue;
        }

        if ($httpCode === 403) {
            echo "  ❌ API returned 403 - video may be private/deleted\n\n";
            $errorCount++;
            $errors[] = "Resource {$resourceId}: Video private/deleted (403)";
            break; // Don't retry 403
        }

        if ($httpCode !== 200) {
            echo "  ❌ API returned HTTP {$httpCode} (attempt {$attempt})\n";
            if ($attempt >= $retryAttempts || $httpCode < 500) {
                $errorCount++;
                $errors[] = "Resource {$resourceId}: HTTP {$httpCode}";
                break; // Don't retry 4xx errors
            }
            continue; // Retry 5xx errors
        }

        // Decode JSON
        try {
            $decoded = json_decode($response, true, 512, JSON_THROW_ON_ERROR);

            if (empty($decoded['items'][0])) {
                echo "  ❌ API response contains no items\n\n";
                $errorCount++;
                $errors[] = "Resource {$resourceId}: No items in API response";
                break;
            }

            $item = $decoded['items'][0];

            // Validate required fields
            if (empty($item['contentDetails']['duration'])) {
                echo "  ⚠️  WARNING: No duration in API response\n";
            }

            $videoData = [
                'title' => $item['snippet']['title'],
                'description' => $item['snippet']['description'] ?? '',
                'thumbnail' => $item['snippet']['thumbnails']['maxresdefault']['url'] ??
                              $item['snippet']['thumbnails']['high']['url'] ??
                              'https://i.ytimg.com/vi/' . $videoId . '/hqdefault.jpg',
                'publishedAt' => $item['snippet']['publishedAt'],
                'duration' => $item['contentDetails']['duration'],
                'viewCount' => $item['statistics']['viewCount'] ?? 0
            ];

            // Save to MODX cache manager
            $saved = $modx->cacheManager->set($cacheKey, $videoData, $cacheLifetime, $cacheOptions);

            if ($saved) {
                echo "  ✅ SUCCESS - Cached (duration: {$videoData['duration']})\n\n";
                $successCount++;
                $success = true;
            } else {
                echo "  ⚠️  WARNING: Failed to save to cache\n\n";
                $errorCount++;
                $errors[] = "Resource {$resourceId}: Cache write failed";
                break;
            }

        } catch (JsonException $e) {
            echo "  ❌ JSON decode error: {$e->getMessage()}\n\n";
            $errorCount++;
            $errors[] = "Resource {$resourceId}: JSON error - {$e->getMessage()}";
            break;
        }
    }

    // Rate limiting: sleep 200ms between requests
    if ($success) {
        usleep(200000);
    }
}

// ============================================================================
// 4. SUMMARY REPORT
// ============================================================================

echo "\n=== MIGRATION COMPLETE ===\n";
echo "End time: " . date('Y-m-d H:i:s') . "\n\n";

echo "Results:\n";
echo "✅ Success: {$successCount}\n";
echo "❌ Errors: {$errorCount}\n";
echo "⚠️  Skipped: {$skippedCount}\n";
echo "📊 Total: {$totalCount}\n\n";

$successRate = $totalCount > 0 ? round(($successCount / $totalCount) * 100, 1) : 0;
echo "Success rate: {$successRate}%\n\n";

if (!empty($errors)) {
    echo "=== ERRORS LOG ===\n";
    foreach ($errors as $error) {
        echo "- {$error}\n";
    }
    echo "\n";
}

// Exit code
if ($errorCount > 0) {
    echo "⚠️  Migration completed with errors\n";
    exit(1);
} else {
    echo "✅ Migration completed successfully\n";
    exit(0);
}
