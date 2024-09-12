<!DOCTYPE html>
<html lang="en">
{include 'file:chunks/main/head.tpl'}
<body>
	{include 'file:chunks/main/header.tpl'}
	<main>
		<h1>{if $_modx->resource.longtitle}{$_modx->resource.longtitle}{else}{$_modx->resource.pagetitle}{/if}</h1>
		<form id="filter-form" method="post">
			<div class="search-main">
				<div class="container">
					<h2 class="main-heading">Select group</h2>
					<div class="search-main__inner">
						<div class="search-main__slider swiper">
							<div class="swiper-wrapper">
								{$_modx->runSnippet('!pdoResources', [
									'parents' => 69,
									'depth' => 0,
									'limit' => 0,
									'includeTVs' => 'photo_filtergroup_pc_img,photo_filtergroup_mobile_img',
									'tpl' => '@FILE chunks/work/filtergroup_tpl.tpl',
									'sortby' => 'menuindex',
									'sortdir' => 'asc'
								])}
							</div>
							<div class="swiper-pagination"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="search-categories">
				<div class="container">
					<h2 class="main-heading">What worries you?</h2>
					<div class="search-categories__inner">				
						{$_modx->runSnippet('!pdoResources', [
							'parents' => 75,
							'depth' => 0,
							'limit' => 0,
							'tpl' => '@FILE chunks/work/filtercategories_tpl.tpl',
							'sortby' => 'menuindex',
							'sortdir' => 'asc'
						])}
					</div>
				</div>
			</div>
		</form>
		<div id="step-1" class="search-services"></div>
		<div id="step-2"></div>
		<div id="step-3" class="videos"></div>
		<div id="step-4" class="shorts"></div>
	</main>
	{include 'file:chunks/main/footer.tpl'}
	<script src="assets/templates/site/js/filter-scripts.js"></script>
</body>
</html>