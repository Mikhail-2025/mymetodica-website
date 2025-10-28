<!DOCTYPE html>
<html lang="en">
{include 'file:chunks/main/head.tpl'}
<body class="main-page"> 
	{include 'file:chunks/main/header.tpl'}
	<main>
		{include 'file:chunks/work/home-slider.tpl'}
		{set $home_service = json_decode($_modx->resource.id |resource: 'home_service', true)}
		{if $home_service}
		<div class="main-services">
			<div class="container">
				<div class="main-services__inner">
					{foreach $home_service as $row}
					<div class="main-services__item">
						<div class="main-services__img">
							<picture>
								<source media="(max-width: 768px)" srcset="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.home_service_mobile_img~'', 'options' => '&w=690&h=314&zc=1&f=webp'])}" type="image/webp">
								<source media="(max-width: 768px)" srcset="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.home_service_mobile_img~'', 'options' => '&w=690&h=314&zc=1'])}">
								<source srcset="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.home_service_pc_img~'', 'options' => '&w=440&h=389&zc=1&f=webp'])}" type="image/webp">
								<img src="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.home_service_pc_img~'', 'options' => '&w=440&h=389&zc=1'])}" alt="">
							</picture>
						</div>
						<div class="main-services__content">
							<span class="grower"></span>
							<h3 class="small-heading">{$row.home_service_name}</h3>
							{var $service = $row.home_service_ids | split}
							{if $service}
							<ul class="main-services__list">
								{foreach $service as $item}
								<li class="main-services__list-item">
									<a class="main-services__link" href="{$item | url}">{$item | resource: 'pagetitle'}</a>
								</li>
								{/foreach}
							</ul>
							{/if}
						</div>
					</div>
					{/foreach}
	
				</div>
			</div>
		</div>
		{/if}
		<div class="practice">
			<div class="container">
				<h2 class="main-heading">Our Practice</h2>
				<div class="practice__inner">
					<div class="practice__img high-radius-img">
						<picture>
							<source srcset="{$_modx->runSnippet('!pThumb', ['input' => $_modx->resource.our_practice_img, 'options' => '&w=548&h=456&f=webp&zc=1'])}" type="image/webp">
        					<img src="{$_modx->runSnippet('!pThumb', ['input' => $_modx->resource.our_practice_img, 'options' => '&w=548&h=456&zc=1'])}" alt="">
						</picture>
					</div>
					<div class="practice__content">
						<div class="main-heading practice__response-heading">Our Practice</div>
						{$_modx->resource.our_practice}
						<div class="practice__btn">
							<a class="btn on-pink" href="{14 | url}">See more</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		{include 'file:chunks/work/home-reviews.tpl'}
		{if $_modx->resource.home_photos_ids}
		<div class="compare">
			<div class="container">
				<h2 class="main-heading">Before & After</h2>
				<div class="compare__inner">
					{$_modx->runSnippet('!pdoResources', [
						'parents' => 27,
						'resources' => $_modx->resource.home_photos_ids,
						'depth' => 0,
						'limit' => 3,
						'includeTVs' => 'photo_before_img,photo_after_img,photo_params,photo_icon',
						'tpl' => '@FILE chunks/work/blog_photos_tpl.tpl',
						'sortby' => '',
						'sortdir' => ''
					])}
				</div>
				<div class="centered-box">
					<a class="btn dark" href="{27 | url}">See more</a>
					<a target="_blank" class="btn" href="https://n1239285.alteg.io/">I wish</a>
				</div>
			</div>
		</div>
		{/if}
		<div class="specialist top-left-radius">
			<div class="container">
				<h2 class="main-heading">Staff</h2>
			</div>
			<div class="slider-container">
				<div class="specialist__slider swiper">
					<div class="swiper-wrapper">
						{$_modx->runSnippet('!pdoResources', [
							'parents' => 31,
							'depth' => 0,
							'limit' => 10,
							'includeTVs' => 'doctor_specialization,doctor_img',
							'tpl' => '@FILE chunks/work/home_doctors_tpl.tpl',
							'sortby' => 'menuindex',
							'sortdir' => 'asc'
						])}						
					</div>
					<div class="swiper-button-prev">
						<svg width="21" height="34" viewBox="0 0 21 34" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M19.1555 0.997559C15.1074 9.59988 11.5395 13.0377 2.92847 16.7754C11.6398 20.6656 15.237 24.1709 19.1555 33.0024" stroke="white" stroke-width="2" />
						</svg>
					</div>
					<div class="swiper-button-next">
						<svg width="21" height="34" viewBox="0 0 21 34" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M1.34425 0.997559C5.39236 9.59988 8.96028 13.0377 17.5713 16.7754C8.85991 20.6656 5.26271 24.1709 1.34425 33.0024" stroke="white" stroke-width="2" />
						</svg>
					</div>
					<div class="swiper-pagination"></div>
				</div>
			</div>
		</div>
		{set $home_ourpartner = json_decode($_modx->resource.id |resource: 'home_ourpartner', true)}
		{if $home_ourpartner}
		<div class="customers">
			<div class="customers__layout">
				<div class="container">
					<h2 class="main-heading">Our partner</h2>
				</div>
				<div class="customers__wrapper">
					<div class="customers__items-wrap">
						<div class="customers__items marquee">
							{foreach $home_ourpartner as $row}
								{if $row.home_ourpartner_link}
								<a target="_blank" class="customers__item" href="{$row.home_ourpartner_link}">
									<picture>
										<source srcset="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.home_ourpartner_img~'', 'options' => 'f=webp'])}" type="image/webp">
										<img src="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.home_ourpartner_img~'', 'options' => 'f=png'])}" alt="">
									</picture>
								</a>
								{else}
								<span class="customers__item">
									<picture>
										<source srcset="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.home_ourpartner_img~'', 'options' => 'f=webp'])}" type="image/webp">
										<img src="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.home_ourpartner_img~'', 'options' => 'f=png'])}" alt="">
									</picture>
								</span>
								{/if}
							{/foreach}
						</div>
						<div class="customers__items marquee" aria-hidden="true">
							{foreach $home_ourpartner as $row}
								{if $row.home_ourpartner_link}
								<a target="_blank" class="customers__item" href="{$row.home_ourpartner_link}">
									<picture>
										<source srcset="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.home_ourpartner_img~'', 'options' => 'f=webp'])}" type="image/webp">
										<img src="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.home_ourpartner_img~'', 'options' => 'f=png'])}" alt="">
									</picture>
								</a>
								{else}
								<span class="customers__item">
									<picture>
										<source srcset="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.home_ourpartner_img~'', 'options' => 'f=webp'])}" type="image/webp">
										<img src="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.home_ourpartner_img~'', 'options' => 'f=png'])}" alt="">
									</picture>
								</span>
								{/if}
							{/foreach}
						</div>
					</div>
				</div>
			</div>
		</div>
		{/if}
		{if $_modx->resource.home_video_ids}
		<div class="videos">
			<div class="container">
				<h2 class="main-heading">Videos</h2>
			</div>
			<div class="slider-container">
				<div class="videos__slider swiper">
					<div class="swiper-wrapper">
						{$_modx->runSnippet('!pdoResources', [
							'parents' => 15,
							'resources' => $_modx->resource.home_video_ids,
							'depth' => 0,
							'limit' => 0,
							'includeTVs' => 'video_link,video_img,video_text',
							'tpl' => '@FILE chunks/work/video_tpl.tpl',
							'sortby' => '',
							'sortdir' => ''
						])}
					</div>
					<div class="swiper-button-prev">
						<svg width="21" height="34" viewBox="0 0 21 34" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M19.1555 0.997559C15.1074 9.59988 11.5395 13.0377 2.92847 16.7754C11.6398 20.6656 15.237 24.1709 19.1555 33.0024" stroke="white" stroke-width="2" />
						</svg>
					</div>
					<div class="swiper-button-next">
						<svg width="21" height="34" viewBox="0 0 21 34" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M1.34425 0.997559C5.39236 9.59988 8.96028 13.0377 17.5713 16.7754C8.85991 20.6656 5.26271 24.1709 1.34425 33.0024" stroke="white" stroke-width="2" />
						</svg>
					</div>
					<div class="swiper-pagination"></div>
				</div>
			</div>
		</div>
		{/if}
		{if $_modx->resource.home_videoshorts_ids}
		<div class="shorts">
			<div class="slider-container">
				<div class="shorts__slider swiper"> 
					<div class="swiper-wrapper">
						{$_modx->runSnippet('!pdoResources', [
							'parents' => 16,
							'resources' => $_modx->resource.home_videoshorts_ids,
							'depth' => 0,
							'limit' => 0,
							'includeTVs' => 'videoshorts_link,videoshorts_img,video_text',
							'tpl' => '@FILE chunks/work/videoshorts_tpl.tpl',
							'sortby' => '',
							'sortdir' => ''
						])}
					</div>
					<div class="swiper-button-prev">
						<svg width="21" height="34" viewBox="0 0 21 34" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M19.1555 0.997559C15.1074 9.59988 11.5395 13.0377 2.92847 16.7754C11.6398 20.6656 15.237 24.1709 19.1555 33.0024" stroke="white" stroke-width="2" />
						</svg>
					</div>
					<div class="swiper-button-next">
						<svg width="21" height="34" viewBox="0 0 21 34" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M1.34425 0.997559C5.39236 9.59988 8.96028 13.0377 17.5713 16.7754C8.85991 20.6656 5.26271 24.1709 1.34425 33.0024" stroke="white" stroke-width="2" />
						</svg>
					</div>
					<div class="swiper-pagination"></div>
				</div>
			</div>
			<div class="centered-box">
				<a target="_blank" class="btn" href="{1 | resource : 'soc_youtube'}">See more</a>
			</div>
		</div>
		{/if}
		{include 'file:chunks/main/follow.tpl'}
		{include 'file:chunks/main/contacts.tpl'}
	</main>
	{include 'file:chunks/main/footer.tpl'}
</body>
</html>