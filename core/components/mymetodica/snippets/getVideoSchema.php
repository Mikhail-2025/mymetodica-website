<?php
/**
 * MODX Snippet: getVideoSchema
 *
 * Генерирует VideoObject Schema markup (JSON-LD)
 * Версия: 2.1 - Watch Page Signals for Google Search Console
 * Дата: 2025-11-04
 *
 * ИЗМЕНЕНИЯ V2.1:
 * - Добавлен @id - уникальный идентификатор видео (Watch page signal)
 * - Добавлен mainEntityOfPage - ссылка на текущую страницу (Watch page signal)
 * - Добавлен potentialAction с WatchAction (Watch page signal)
 * - Улучшена совместимость с Google Search Console video indexing
 *
 * ИЗМЕНЕНИЯ V2.0:
 * - Добавлен fallback на устаревший кэш при отсутствии duration
 * - getVideoSchema теперь может прогревать кэш самостоятельно
 * - Исправлены уровни логирования
 * - Улучшена устойчивость к временным сбоям API
 *
 * ИЗМЕНЕНИЯ V1.3:
 * - Removed MedicalBusiness duplication - only @id reference
 * - Requires getOrganizationSchema for full Organization data
 */

// ============================================================================
// 1. ПОЛУЧЕНИЕ ДАННЫХ СТРАНИЦЫ
// ============================================================================

$resourceId = $modx->resource->get('id');
$pagetitle = $modx->resource->get('pagetitle');
$description = $modx->resource->get('description');

// Support both regular videos (video_link) and Shorts (videoshorts_link)
$videoLink = $modx->resource->getTVValue('video_link');
if (empty($videoLink)) {
    $videoLink = $modx->resource->getTVValue('videoshorts_link');
}

$videoText = $modx->resource->getTVValue('video_text');

if (empty($videoLink)) {
    return ''; // Нет видео - нет Schema
}

// Извлечение YouTube video ID (поддержка обычных видео, Shorts, youtu\.be, embed)
preg_match('/(?:youtube\.com\/(?:watch\?v=|shorts\/|embed\/)|youtu\.be\/)([a-zA-Z0-9_-]+)/', $videoLink, $matches);
$videoId = $matches[1] ?? null;

if (!$videoId) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[getVideoSchema] Invalid YouTube URL: ' . $videoLink . ' (Resource ID: ' . $resourceId . ')');
    return '';
}

$currentUrl = $modx->makeUrl($resourceId, '', '', 'full');
$siteUrl = rtrim(MODX_SITE_URL, '/');

// ============================================================================
// 2. ПОЛУЧЕНИЕ ДАННЫХ ИЗ CACHE
// ============================================================================

$cacheKey = 'youtube/video_' . $videoId;
$cacheOptions = [
    xPDO::OPT_CACHE_KEY => 'youtube_data',
];

$youtubeData = $modx->cacheManager->get($cacheKey, $cacheOptions);

// ============================================================================
// 3. STALE CACHE FALLBACK (если кэш пуст или нет duration)
// ============================================================================

if (empty($youtubeData) || empty($youtubeData['duration'])) {
    $modx->log(modX::LOG_LEVEL_INFO,
        '[getVideoSchema] Cache missing or no duration for video ' . $videoId . ' - trying stale cache'
    );

    // Try to read expired cache file directly
    $cacheDir = MODX_CORE_PATH . 'cache/youtube_data/';
    $cacheFile = $cacheDir . $cacheKey . '.cache.php';

    if (file_exists($cacheFile)) {
        try {
            $staleData = include $cacheFile;

            if (is_array($staleData) && !empty($staleData['duration'])) {
                $modx->log(modX::LOG_LEVEL_WARN,
                    '[getVideoSchema] Using STALE CACHE for ' . $videoId . ' (API may be down or quota exceeded)'
                );

                $youtubeData = $staleData;

                // Extend stale cache TTL to avoid repeated API calls
                $modx->cacheManager->set($cacheKey, $staleData, 3600, $cacheOptions); // 1 hour extension
            }
        } catch (Exception $e) {
            $modx->log(modX::LOG_LEVEL_WARN, '[getVideoSchema] Failed to read stale cache: ' . $e->getMessage());
        }
    }
}

// ============================================================================
// 4. ПРОВЕРКА ОБЯЗАТЕЛЬНЫХ ПОЛЕЙ
// ============================================================================

// duration - CRITICAL! Без него Schema бесполезна
if (empty($youtubeData['duration'])) {
    $modx->log(modX::LOG_LEVEL_ERROR,
        '[getVideoSchema] BLOCKING: No duration available for video ' . $videoId .
        ' (Resource ID: ' . $resourceId . '). Schema will NOT be generated. ' .
        'This usually means: 1) First page load (cache not primed yet), 2) API quota exceeded, 3) API error. ' .
        'Check getVideoContent logs for details.'
    );
    return '<!-- VideoObject Schema blocked: duration required (check getVideoContent logs) -->';
}

// Подготовка данных с fallback'ами
$title = $youtubeData['title'] ?? $pagetitle;
$schemaDescription = $youtubeData['description'] ?? $description ?? '';

// Sanitize description
if (!empty($schemaDescription)) {
    $schemaDescription = preg_replace('/\s+/', ' ', $schemaDescription);
    $schemaDescription = preg_replace('/[\x{1F600}-\x{1F64F}]/u', '', $schemaDescription);
    $schemaDescription = trim($schemaDescription);
    $schemaDescription = mb_substr($schemaDescription, 0, 5000, 'UTF-8');
}

$thumbnailUrl = $youtubeData['thumbnail'] ?? 'https://i.ytimg.com/vi/' . $videoId . '/maxresdefault.jpg';
$uploadDate = $youtubeData['publishedAt'] ?? date('c');
$duration = $youtubeData['duration']; // Already validated above

$modx->log(modX::LOG_LEVEL_INFO, '[getVideoSchema] Generating schema for video ' . $videoId . ' with duration: ' . $duration);

// ============================================================================
// 5. ПОДГОТОВКА TRANSCRIPT (plain string!)
// ============================================================================

$transcript = '';
if (!empty($videoText)) {
    $transcript = strip_tags($videoText);
    $transcript = preg_replace('/\s+/', ' ', $transcript); // Normalize whitespace
    $transcript = trim($transcript);
    $transcript = mb_substr($transcript, 0, 5000, 'UTF-8'); // Cap at 5000 chars
}

// ============================================================================
// 6. ГЕНЕРАЦИЯ VIDEOOBJECT SCHEMA
// ============================================================================

$schema = [
    '@context' => 'https://schema.org',
    '@type' => 'VideoObject',
    '@id' => $currentUrl . '#video', // Unique video identifier
    'mainEntityOfPage' => $currentUrl, // Watch page signal
    'name' => $title,
    'description' => $schemaDescription,
    'thumbnailUrl' => [
        $thumbnailUrl,
        'https://i.ytimg.com/vi/' . $videoId . '/hqdefault.jpg'
    ],
    'uploadDate' => $uploadDate,
    'duration' => $duration, // REQUIRED!
    'contentUrl' => 'https://www.youtube.com/watch?v=' . $videoId,
    'embedUrl' => 'https://www.youtube.com/embed/' . $videoId,

    // Publisher - ONLY reference (full data in getOrganizationSchema)
    'publisher' => [
        '@id' => $siteUrl . '/#organization'
    ],

    // Author - medical professional (E-E-A-T)
    'author' => [
        '@type' => 'Person',
        'name' => 'Dr. Metodica',
        'jobTitle' => 'Medical Director',
        'affiliation' => [
            '@id' => $siteUrl . '/#organization'  // ONLY reference
        ]
    ]
];

// Add transcript if available (plain string, not WebPageElement!)
if (!empty($transcript)) {
    $schema['transcript'] = $transcript; // Just a string!
}

// Optional: Add view count if available
if (!empty($youtubeData['viewCount'])) {
    $schema['interactionStatistic'] = [
        '@type' => 'InteractionCounter',
        'interactionType' => 'https://schema.org/WatchAction',
        'userInteractionCount' => (int)$youtubeData['viewCount']
    ];
}

// Add potentialAction (Watch page signal for Google)
$schema['potentialAction'] = [
    '@type' => 'WatchAction',
    'target' => [
        '@type' => 'EntryPoint',
        'urlTemplate' => $currentUrl,
        'actionPlatform' => [
            'https://schema.org/DesktopWebPlatform',
            'https://schema.org/MobileWebPlatform',
            'https://schema.org/IOSPlatform',
            'https://schema.org/AndroidPlatform'
        ]
    ]
];

// ============================================================================
// 7. ВЫВОД JSON-LD
// ============================================================================

try {
    $json = json_encode($schema, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_THROW_ON_ERROR);
    return '<script type="application/ld+json">' . $json . '</script>';

} catch (JsonException $e) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[getVideoSchema] JSON encode error: ' . $e->getMessage() . ' (Resource ID: ' . $resourceId . ')');
    return '';
}
