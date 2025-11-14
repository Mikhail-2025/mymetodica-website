<?php
/**
 * MODX Snippet: getVideoOgTags
 * Генерирует Open Graph и Twitter Player мета-теги для видео-страниц.
 */

$templateId = (int) $modx->resource->get('template');
if (!in_array($templateId, [5, 6], true)) {
    return '';
}

$videoLink = $modx->resource->getTVValue('video_link');
if (empty($videoLink)) {
    $videoLink = $modx->resource->getTVValue('videoshorts_link');
}
if (empty($videoLink)) {
    return '';
}

if (!preg_match('/(?:youtube\.com\/(?:watch\?v=|shorts\/|embed\/)|youtu\.be\/)([a-zA-Z0-9_-]+)/', $videoLink, $matches)) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[getVideoOgTags] Invalid YouTube URL: ' . $videoLink . ' (Resource ID: ' . $modx->resource->get('id') . ')');
    return '';
}
$videoId = $matches[1];

$currentUrl = $modx->makeUrl($modx->resource->get('id'), '', '', 'full');
$pagetitle = (string) $modx->resource->get('pagetitle');
$metaTitle = $modx->resource->get('meta_title');
$metaTitle = is_string($metaTitle) ? $metaTitle : '';
$metaDesc = $modx->resource->get('meta_desc');
$metaDesc = is_string($metaDesc) ? $metaDesc : '';

$title = trim($metaTitle) !== '' ? $metaTitle : $pagetitle;
$title = strip_tags($title);
$description = strip_tags($metaDesc);

$tags = [
    '<meta property="og:type" content="video.other" />',
    '<meta property="og:site_name" content="MyMetodica" />',
    '<meta property="og:url" content="' . htmlspecialchars($currentUrl, ENT_QUOTES, 'UTF-8') . '" />',
    '<meta property="og:title" content="' . htmlspecialchars($title, ENT_QUOTES, 'UTF-8') . '" />',
    '<meta property="og:description" content="' . htmlspecialchars($description, ENT_QUOTES, 'UTF-8') . '" />',
    '<meta property="og:video" content="https://www.youtube.com/embed/' . $videoId . '" />',
    '<meta property="og:video:url" content="https://www.youtube.com/watch?v=' . $videoId . '" />',
    '<meta property="og:video:secure_url" content="https://www.youtube.com/embed/' . $videoId . '" />',
    '<meta property="og:video:type" content="text/html" />',
    '<meta property="og:video:width" content="1280" />',
    '<meta property="og:video:height" content="720" />',
    '<meta property="og:image" content="https://i.ytimg.com/vi/' . $videoId . '/maxresdefault.jpg" />',
    '<meta property="og:image:secure_url" content="https://i.ytimg.com/vi/' . $videoId . '/maxresdefault.jpg" />',
    '<meta property="og:image:type" content="image/jpeg" />',
    '<meta property="og:image:width" content="1280" />',
    '<meta property="og:image:height" content="720" />',
    '<meta property="og:image:alt" content="' . htmlspecialchars($pagetitle, ENT_QUOTES, 'UTF-8') . '" />',
    '<meta name="twitter:card" content="player" />',
    '<meta name="twitter:title" content="' . htmlspecialchars($title, ENT_QUOTES, 'UTF-8') . '" />',
    '<meta name="twitter:description" content="' . htmlspecialchars($description, ENT_QUOTES, 'UTF-8') . '" />',
    '<meta name="twitter:player" content="https://www.youtube.com/embed/' . $videoId . '" />',
    '<meta name="twitter:player:width" content="1280" />',
    '<meta name="twitter:player:height" content="720" />',
    '<meta name="twitter:image" content="https://i.ytimg.com/vi/' . $videoId . '/maxresdefault.jpg" />'
];

return implode("\n\t", $tags);
