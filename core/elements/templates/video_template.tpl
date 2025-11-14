{*
 * MODX Template: Video Page
 * Template ID: 5 ("Видео")
 * Version: 1.0 - Production Ready
 * Date: 2025-11-01
 *
 * REQUIREMENTS:
 * - Snippets: getVideoContent, getVideoSchema
 * - Assets: /assets/templates/css/video-page.css
 * - Assets: /assets/templates/js/video-page.js
 *}

{include 'file:chunks/main/head.tpl'}
{include 'file:chunks/main/header.tpl'}

<main class="video-page">
    <div class="container">
        {* Generate HTML content (title, description, video, transcript) *}
        {$_modx->runSnippet('!getVideoContent')}
    </div>
</main>

{include 'file:chunks/main/footer.tpl'}
