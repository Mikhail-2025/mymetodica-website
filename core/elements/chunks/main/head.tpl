<head>
	<meta charset="UTF-8">
	<base href="{$_modx->config.site_url}">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="icon" href="assets/templates/site/img/svg/fav.svg" type="image/svg+xml">
	<link rel="stylesheet" href="assets/templates/site/css/swiper.css">
	<link rel="stylesheet" href="assets/templates/site/css/fancybox.css">
	<link rel="stylesheet" href="assets/templates/site/css/twenty-twenty.css">
	<link rel="stylesheet" href="assets/templates/site/css/style.css">
	<link rel="stylesheet" href="assets/templates/site/css/add-style.css">
	{if $_modx->resource.meta_title}<title>{$_modx->resource.meta_title | notags}</title>{else}<title>{$_modx->resource.pagetitle | notags} - {$_modx->config.site_name}</title>{/if}
    <meta name="description" content="{$_modx->resource.meta_desc}" />
	<meta name="keywords" content="{$_modx->resource.meta_key}" />
</head>