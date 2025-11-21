<?php
/**
 * MODX Snippet: getWebPageSchema
 *
 * Генерирует WebPage Schema markup для video watch pages
 * Версия: 1.0
 * Дата: 2025-11-04
 *
 * Назначение:
 * - Усиливает watch page сигнал для Google Search Console
 * - Связывает WebPage с VideoObject через mainEntity
 * - Используется только для шаблонов 5 и 6 (video pages)
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

// Если нет видео - не выводим WebPage schema
if (empty($videoLink)) {
    return '';
}

$currentUrl = $modx->makeUrl($resourceId, '', '', 'full');
$siteUrl = rtrim(MODX_SITE_URL, '/');

// ============================================================================
// 2. ГЕНЕРАЦИЯ WEBPAGE SCHEMA
// ============================================================================

$schema = [
    '@context' => 'https://schema.org',
    '@type' => 'WebPage',
    '@id' => $currentUrl,
    'url' => $currentUrl,
    'name' => $pagetitle,
    'description' => $description,

    // mainEntity - ссылка на VideoObject (watch page signal)
    'mainEntity' => [
        '@id' => $currentUrl . '#video'
    ],

    // isPartOf - ссылка на сайт
    'isPartOf' => [
        '@id' => $siteUrl . '/#website'
    ],

    // about - о чём страница
    'about' => [
        '@id' => $currentUrl . '#video'
    ],

    // primaryImageOfPage - thumbnail видео
    'primaryImageOfPage' => [
        '@type' => 'ImageObject',
        'url' => $modx->resource->getTVValue('og_image') ?: $siteUrl . '/assets/images/og-default.jpg'
    ]
];

// ============================================================================
// 3. ВЫВОД JSON-LD
// ============================================================================

try {
    $json = json_encode($schema, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_THROW_ON_ERROR);
    return '<script type="application/ld+json">' . $json . '</script>';

} catch (JsonException $e) {
    $modx->log(modX::LOG_LEVEL_ERROR, '[getWebPageSchema] JSON encode error: ' . $e->getMessage() . ' (Resource ID: ' . $resourceId . ')');
    return '';
}
