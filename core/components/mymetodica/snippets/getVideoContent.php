<?php
/**
 * MODX Snippet: getVideoContent
 * Версия: 2.0 - Fixed Logging Levels and API Key Masking
 * Дата: 2025-11-02
 *
 * ИЗМЕНЕНИЯ V2.0:
 * - Исправлены уровни логирования (INFO для штатных событий, ERROR только для реальных ошибок)
 * - Маскировка API-ключей в логах (показываем только первые 4 и последние 4 символа)
 * - Улучшена читаемость и структура кода
 */

// Получение данных страницы
$resourceId = $modx->resource->get('id');
$pagetitle = $modx->resource->get('pagetitle');

$videoLink = $modx->resource->getTVValue('video_link');
if (empty($videoLink)) {
    $videoLink = $modx->resource->getTVValue('videoshorts_link');
}

$videoText = $modx->resource->getTVValue('video_text');

if (empty($videoLink)) {
    $modx->log(modX::LOG_LEVEL_WARN, '[getVideoContent] No video_link for resource ' . $resourceId);
    return '<p class="video-error">Video not available</p>';
}

// Извлечение video ID
preg_match('/(?:youtube\.com\/(?:watch\?v=|shorts\/|embed\/)|youtu\.be\/)([a-zA-Z0-9_-]+)/', $videoLink, $matches);
$videoId = $matches[1] ?? null;

if (!$videoId) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[getVideoContent] Invalid YouTube URL: ' . $videoLink);
    return '<p class="video-error">Invalid video URL</p>';
}

$modx->log(modX::LOG_LEVEL_INFO, '[getVideoContent] Processing video ' . $videoId . ' (Resource ' . $resourceId . ')');

// Проверка кэша
$cacheKey = 'youtube/video_' . $videoId;
$cacheOptions = [xPDO::OPT_CACHE_KEY => 'youtube_data'];
$youtubeData = $modx->cacheManager->get($cacheKey, $cacheOptions);

if (empty($youtubeData)) {
    $modx->log(modX::LOG_LEVEL_INFO, '[getVideoContent] Cache MISS for ' . $videoId . ' - fetching from API');

    $credentialsPath = MODX_BASE_PATH . 'config/youtube_credentials.php';

    if (!file_exists($credentialsPath)) {
        $modx->log(modX::LOG_LEVEL_ERROR, '[getVideoContent] Credentials file NOT FOUND: ' . $credentialsPath);
    } else {
        $credentials = require $credentialsPath;

        // Mask API key for logging
        $maskedKey = 'DISABLED';
        if (!empty($credentials['api_key']) && $credentials['api_key'] !== 'YOUR_YOUTUBE_API_KEY_HERE') {
            $maskedKey = substr($credentials['api_key'], 0, 4) . '***' . substr($credentials['api_key'], -4);
        }

        $modx->log(modX::LOG_LEVEL_INFO, '[getVideoContent] API enabled: ' . ($credentials['enabled'] ? 'YES' : 'NO') . ', API key: ' . $maskedKey);

        if ($credentials['enabled'] && !empty($credentials['api_key']) && $credentials['api_key'] !== 'YOUR_YOUTUBE_API_KEY_HERE') {
            $apiUrl = 'https://www.googleapis.com/youtube/v3/videos?id=' . $videoId . '&part=contentDetails,snippet,statistics&key=' . $credentials['api_key'];

            $modx->log(modX::LOG_LEVEL_INFO, '[getVideoContent] Making API request for ' . $videoId);

            $ch = curl_init($apiUrl);
            curl_setopt_array($ch, [
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_SSL_VERIFYPEER => true,
                CURLOPT_TIMEOUT => $credentials['timeout'],
                CURLOPT_HEADER => false
            ]);

            $response = curl_exec($ch);
            $httpCode = curl_getinfo($ch, CURLINFO_HTTP_CODE);
            $curlError = curl_error($ch);
            curl_close($ch);

            if ($response === false || !empty($curlError)) {
                $modx->log(modX::LOG_LEVEL_ERROR, '[getVideoContent] cURL ERROR for ' . $videoId . ': ' . $curlError);
            } elseif ($httpCode !== 200) {
                $errorMsg = '[getVideoContent] HTTP ' . $httpCode . ' for ' . $videoId;
                if ($httpCode === 429) {
                    $errorMsg .= ' (QUOTA EXCEEDED - consider reducing API requests or upgrading quota)';
                }
                $modx->log(modX::LOG_LEVEL_ERROR, $errorMsg . '. Response: ' . substr($response, 0, 500));
            } else {
                try {
                    $decoded = json_decode($response, true, 512, JSON_THROW_ON_ERROR);

                    if (empty($decoded['items'][0])) {
                        $modx->log(modX::LOG_LEVEL_ERROR, '[getVideoContent] Empty items for ' . $videoId . '. Response: ' . substr($response, 0, 1000));
                    } else {
                        $item = $decoded['items'][0];
                        $youtubeData = [
                            'title' => $item['snippet']['title'],
                            'description' => $item['snippet']['description'],
                            'thumbnail' => $item['snippet']['thumbnails']['maxresdefault']['url'] ?? $item['snippet']['thumbnails']['high']['url'],
                            'publishedAt' => $item['snippet']['publishedAt'],
                            'duration' => $item['contentDetails']['duration'],
                            'viewCount' => $item['statistics']['viewCount'] ?? 0
                        ];

                        $cached = $modx->cacheManager->set($cacheKey, $youtubeData, $credentials['cache_lifetime'], $cacheOptions);

                        if (!$cached) {
                            $modx->log(modX::LOG_LEVEL_WARN, '[getVideoContent] FAILED to cache ' . $videoId);
                        } else {
                            $modx->log(modX::LOG_LEVEL_INFO, '[getVideoContent] SUCCESS: Fetched and cached ' . $videoId);
                        }
                    }
                } catch (JsonException $e) {
                    $modx->log(modX::LOG_LEVEL_ERROR, '[getVideoContent] JSON parse error: ' . $e->getMessage());
                }
            }
        } else {
            $modx->log(modX::LOG_LEVEL_WARN, '[getVideoContent] API disabled or invalid key');
        }
    }
} else {
    $modx->log(modX::LOG_LEVEL_INFO, '[getVideoContent] Cache HIT for ' . $videoId);
}

// Генерация HTML
$shortDescription = '';
if (!empty($youtubeData['description'])) {
    $desc = preg_replace('/\s+/', ' ', $youtubeData['description']);
    $desc = preg_replace('/[\x{1F600}-\x{1F64F}]/u', '', $desc);
    $desc = trim($desc);
    $shortDescription = mb_substr($desc, 0, 500, 'UTF-8');
    if (mb_strlen($desc, 'UTF-8') > 500) {
        $shortDescription .= '...';
    }
} elseif (!empty($videoText)) {
    $stripped = strip_tags($videoText);
    $stripped = preg_replace('/\s+/', ' ', $stripped);
    $shortDescription = mb_substr($stripped, 0, 500, 'UTF-8') . '...';
}

$embedUrl = 'https://www.youtube.com/embed/' . $videoId;
$output = '<article class="video-content">';
$output .= '<h1 class="video-title">' . htmlspecialchars($pagetitle, ENT_QUOTES, 'UTF-8') . '</h1>';

if (!empty($shortDescription)) {
    $output .= '<div class="video-summary"><details><summary>Show Description</summary><p>' . htmlspecialchars($shortDescription, ENT_QUOTES, 'UTF-8') . '</p></details></div>';
}

$output .= '<div class="video-container"><iframe width="100%" height="500" src="' . htmlspecialchars($embedUrl, ENT_QUOTES, 'UTF-8') . '" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen loading="lazy" title="' . htmlspecialchars($pagetitle, ENT_QUOTES, 'UTF-8') . '"></iframe></div>';

if (!empty($videoText) && trim(strip_tags($videoText)) !== '') {
    $output .= '<div class="video-transcript"><details class="transcript-details"><summary class="transcript-summary"><h2>Full Video Transcript</h2></summary><div class="transcript-content">' . $videoText . '</div></details></div>';
}

$output .= '</article>';

return $output;
