/**
 * Video Page Smart Redirect v2.0
 *
 * ЦЕЛЬ: Скрыть video pages от пользователей, показать только Google
 *
 * ЛОГИКА:
 * - Если пользователь пришёл из Google/извне → редирект на homepage с секцией #videos
 * - Если пришёл с сайта (internal navigation) → тоже редирект (video pages НЕ нужны пользователям)
 * - Исключение: Googlebot и другие crawlers → показать полную страницу
 *
 * Version: 2.0
 * Date: 2025-11-01
 */

(function() {
    'use strict';

    // Detect if this is a bot/crawler (Google, Bing, etc.)
    var userAgent = navigator.userAgent.toLowerCase();
    var isBot = /bot|crawler|spider|crawling|googlebot|bingbot|yandex/i.test(userAgent);

    if (isBot) {
        // Bot detected → show full page (for indexing)
        console.log('[Video Redirect] Bot detected, showing full page for indexing');
        return;
    }

    // For ALL human users (internal and external) → redirect to homepage
    console.log('[Video Redirect] Human user detected, redirecting to homepage #videos');

    // Redirect to homepage with #videos anchor
    // User will see video in Fancybox carousel on homepage
    window.location.replace('/#videos');
})();
