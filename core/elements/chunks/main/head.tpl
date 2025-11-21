{'@FILE snippets/setDiscountConfig.php' | snippet}
<head>
	<meta charset="UTF-8">
	<base href="{$_modx->config.site_url}">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<!-- Preload первой критичной картинки слайдера -->
	<link rel="preload" as="image" href="/assets/components/phpthumbof/cache/carboxy-offer-slider.f0a810f8abc21e665172c63f9c17bbfe.webp" type="image/webp">

	<link rel="icon" href="assets/templates/site/img/svg/fav.svg" type="image/svg+xml">
	<link rel="stylesheet" href="assets/templates/site/css/swiper.css">
	<link rel="stylesheet" href="assets/templates/site/css/fancybox.css">
	<link rel="stylesheet" href="assets/templates/site/css/twenty-twenty.css">
	<link rel="stylesheet" href="assets/templates/site/css/style.css?v50">
	<link rel="stylesheet" href="assets/templates/site/css/add-style.css?v50">
	{if $_modx->resource.template == 5}
	<link rel="stylesheet" href="assets/templates/site/css/video-page.css?v=40">
	{/if}
	{if $_modx->resource.template == 6}
	<link rel="stylesheet" href="assets/templates/site/css/shorts-page.css?v=58">
	{/if}
	<!-- 2025-05-30: Removed site_name from titles -->
	<!-- {if $_modx->resource.meta_title}<title>{$_modx->resource.meta_title | notags}</title>{else}<title>{$_modx->resource.pagetitle | notags} - {$_modx->config.site_name}</title>{/if} -->
	<title>{$_modx->resource.meta_title ?: $_modx->resource.pagetitle | notags}</title>
	<meta name="description" content="{$_modx->resource.meta_desc}" />
	<meta name="keywords" content="{$_modx->resource.meta_key}" />

	<!-- Open Graph / Twitter -->
	{if $_modx->resource.template == 5 || $_modx->resource.template == 6}
	    {$_modx->runSnippet('!getVideoOgTags')}
	{else}
	    <meta property="og:type" content="website" />
	    <meta property="og:site_name" content="MyMetodica" />
	    <meta property="og:url" content="[[++site_url]]{$_modx->resource.uri}" />
	    <meta property="og:title" content="{$_modx->resource.meta_title ?: $_modx->resource.pagetitle | notags}" />
	    <meta property="og:description" content="{$_modx->resource.meta_desc}" />
	    {if $_modx->resource.og_image}
	    <meta property="og:image" content="[[++site_url]]{$_modx->resource.og_image}" />
	    <meta property="og:image:secure_url" content="[[++site_url]]{$_modx->resource.og_image}" />
	    <meta property="og:image:type" content="image/png" />
	    <meta property="og:image:width" content="800" />
	    <meta property="og:image:height" content="800" />
	    <meta property="og:image:alt" content="{$_modx->resource.og_image_alt ?: $_modx->resource.pagetitle | notags}" />
	    {else}
	    <meta property="og:image" content="[[++site_url]]assets/images/og-default.jpg" />
	    <meta property="og:image:type" content="image/jpeg" />
	    {/if}

	    <meta name="twitter:card" content="summary_large_image" />
	    {if $_modx->resource.og_image}
	    <meta name="twitter:image" content="[[++site_url]]{$_modx->resource.og_image}" />
	    {/if}
	    <meta name="twitter:title" content="{$_modx->resource.meta_title ?: $_modx->resource.pagetitle | notags}" />
	    <meta name="twitter:description" content="{$_modx->resource.meta_desc}" />
	{/if}

	<!-- Google Tag Manager -->
	<script>(function(w,d,s,l,i) { w[l]=w[l]||[];w[l].push({ 'gtm.start':
	new Date().getTime(),event:'gtm.js' });var f=d.getElementsByTagName(s)[0],
	j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
	'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
	})(window,document,'script','dataLayer','GTM-P6G3Q3F7');</script>
	<!-- End Google Tag Manager -->

	{if $_modx->resource.id != 1}
	    {$_modx->runSnippet('getBreadcrumbs')}
	{/if}

	{$_modx->runSnippet('!getOrganizationSchema')}

	{if $_modx->resource.template == 21}
	    {$_modx->runSnippet('!getServiceSchema')}
	{/if}

	{if $_modx->resource.template == 5 || $_modx->resource.template == 6}
	    {$_modx->setPlaceholder('video.schema', $_modx->runSnippet('!getVideoSchema'))}
	    {$_modx->setPlaceholder('webpage.schema', $_modx->runSnippet('!getWebPageSchema'))}
	{/if}
	{$_modx->getPlaceholder('video.schema')}
	{$_modx->getPlaceholder('webpage.schema')}
</head>
