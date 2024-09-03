<!DOCTYPE html>
<html lang="en">
{include 'file:chunks/main/head.tpl'}
<body>
	{include 'file:chunks/main/header.tpl'}
	<main>
		<div class="about-main">
			<div class="container">
				<h1>{if $_modx->resource.longtitle}{$_modx->resource.longtitle}{else}{$_modx->resource.pagetitle}{/if}</h1>
				<div class="about-main__inner">
					<div class="about-main__text">
						{$_modx->resource.content}
					</div>
					<div class="about-main__img">
						<picture>
							<source srcset="assets/templates/site/img/webp/am@x2.webp" type="image/webp">
							<img src="assets/templates/site/img/am@x2.png" alt="">
						</picture>
					</div>
				</div>
			</div>
		</div>
		{set $about_service = json_decode($_modx->resource.id |resource: 'about_service', true)}
		{if $about_service}
		<div class="about-services">
			<div class="container">
				<div class="about-services__inner">
					{foreach $about_service as $row}
					<a class="services-card" href="{$row.about_service_link | url}">
						<div class="services-card__img">
							<picture>
								<source media="(max-width: 768px)" srcset="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.about_service_img_mobile~'', 'options' => '&w=690&h=314&zc=1&f=webp'])}" type="image/webp">
								<source media="(max-width: 768px)" srcset="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.about_service_img_mobile~'', 'options' => '&w=690&h=314&zc=1'])}">
								<source srcset="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.about_service_img_pc~'', 'options' => '&w=670&h=730&zc=1&f=webp'])}" type="image/webp">
								<img src="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.about_service_img_pc~'', 'options' => '&w=670&h=730&zc=1'])}" alt="">
							</picture>
						</div>
						<h3 class="small-heading services-card__name">{$row.about_service_name}</h3>
					</a>
					{/foreach}
				</div>
			</div>
		</div>
		{/if}
		{$_modx->resource.id | resource: 'about_advantages'}
		<div class="follow pink">
			<div class="container">
				<div class="follow__inner">
					<div class="follow__img">
						<img src="assets/templates/site/img/svg/follow-white.svg" alt="">
					</div>
					<div class="follow__content">
						<h2 class="main-heading text-left">We are waiting for you in our clinic!</h2>
						<button class="btn" href="#modal" data-fancybox>Book now</button>
					</div>
				</div>
			</div>
		</div>
		{set $about_info = json_decode($_modx->resource.id |resource: 'about_info', true)}
		{if $about_info}
		<div class="about-info bottom-right-radius">
			<div class="container">
				{foreach $about_info as $row}
				<div class="about-info__item">
					<h2 class="main-heading">{$row.about_info_title}</h2>
					<div class="about-info__inner">
						<div class="about-info__img high-radius-img">
							<picture>
								<source srcset="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.about_info_img~'', 'options' => '&f=webp'])}" type="image/webp">
								<img src="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.about_info_img~'', 'options' => '&f=png'])}" alt="">
							</picture>
						</div>
						<div class="about-info__text">
							{$row.about_info_desc}
						</div>
					</div>
				</div>
				{/foreach}
			</div>
		</div>
		{/if}
		{set $about_gallery = json_decode($_modx->resource.id |resource: 'about_gallery', true)}
		{if $about_gallery}
		<div class="clinic">
			<div class="container">
				<h2 class="main-heading">Our clinic</h2>
			</div>
			<div class="slider-container">
				<div class="clinic__slider swiper">
					<div class="swiper-wrapper">
						{foreach $about_gallery as $row}
						<a class="clinic__slider-item swiper-slide" href="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.about_gallery_img~'', 'options' => '&w=800'])}" data-fancybox="clinic">
							<picture>
								<source srcset="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.about_gallery_img~'', 'options' => '&w=335&h=335&zc=1&f=webp'])}" type="image/webp">
								<img src="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.about_gallery_img~'', 'options' => '&w=335&h=335&zc=1'])}" alt="">
							</picture>
						</a>
						{/foreach}
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
		{if $_modx->resource.about_video_ids}
		<div class="videos">
			<div class="container">
				<h2 class="main-heading">Videos</h2>
			</div>
			<div class="slider-container">
				<div class="videos__slider swiper">
					<div class="swiper-wrapper">
						{$_modx->runSnippet('!pdoResources', [
							'parents' => 15,
							'resources' => $_modx->resource.about_video_ids,
							'depth' => 0,
							'limit' => 20,
							'includeTVs' => 'video_link,video_img',
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
		{if $_modx->resource.about_videoshorts_ids}
		<div class="shorts">
			<div class="slider-container">
				<div class="shorts__slider swiper">
					<div class="swiper-wrapper">
						{$_modx->runSnippet('!pdoResources', [
							'parents' => 16,
							'resources' => $_modx->resource.about_videoshorts_ids,
							'depth' => 0,
							'limit' => 20,
							'includeTVs' => 'videoshorts_link,videoshorts_img',
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
				<a target="_blank" class="btn" href="https://www.youtube.com/@metodica-medspa">See more</a>
			</div>
		</div>
		{/if}
		{include 'file:chunks/main/follow.tpl'}
		{include 'file:chunks/main/contacts.tpl'}
	</main>
	{include 'file:chunks/main/footer.tpl'}
</body>
</html>