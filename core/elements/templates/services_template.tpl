<!DOCTYPE html>
<html lang="en">
{include 'file:chunks/main/head.tpl'}
<body>
	{include 'file:chunks/main/header.tpl'}
	<main>
		<div class="services-main">
			<div class="services-main__banner">
				<picture>
					<source media="(max-width: 768px)" srcset="{$_modx->runSnippet('!pThumb', ['input' => $_modx->resource.services_mobile_img, 'options' => '&w=750&h=582&f=webp&zc=1'])}" type="image/webp">
					<source media="(max-width: 768px)" srcset="{$_modx->runSnippet('!pThumb', ['input' => $_modx->resource.services_mobile_img, 'options' => '&w=750&h=582&zc=1'])}">
					<source srcset="{$_modx->runSnippet('!pThumb', ['input' => $_modx->resource.services_pc_img, 'options' => '&w=1903&h=606&f=webp&zc=1'])}" type="image/webp">
					<img src="{$_modx->runSnippet('!pThumb', ['input' => $_modx->resource.services_pc_img, 'options' => '&w=1903&h=606&zc=1'])}" alt="">
				</picture>
			</div>
			<div class="services-main__content">
				<div class="container">
					<div class="services-main__inner">
						<h2 class="main-heading text-left">{if $_modx->resource.longtitle}{$_modx->resource.longtitle}{else}{$_modx->resource.pagetitle}{/if}</h2>
						<div class="services-main__text">
							{$_modx->resource.content}
						</div>
						<div class="services-main__categories">
							<a class="services-main__link jsAnchorLink" href="#prices">Prices</a>
							{if $_modx->resource.services_doctors_ids}<a class="services-main__link jsAnchorLink" href="#specialists">Doctors</a>{/if}
							{if $_modx->resource.services_blogs_ids}<a class="services-main__link jsAnchorLink" href="#stocks">Stock</a>{/if}
							<a class="services-main__link jsAnchorLink" href="#reviews">Reviews</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="services-categories">
			<div class="container">
				<div class="services-categories__inner">
					{$_modx->runSnippet('!pdoResources', [
						'parents' => $_modx->resource.id,
						'depth' => 0,
						'limit' => 0,
						'tpl' => '@FILE chunks/work/services_razdel_tpl.tpl',
						'sortby' => 'menuindex',
						'sortdir' => 'asc'
					])}
				</div>
			</div>
		</div>
		{if $_modx->resource.services_video_ids}
		<div class="videos">
			<div class="container">
				<h2 class="main-heading">Videos</h2>
			</div>
			<div class="slider-container">
				<div class="videos__slider swiper">
					<div class="swiper-wrapper">
						{$_modx->runSnippet('!pdoResources', [
							'parents' => 15,
							'resources' => $_modx->resource.services_video_ids,
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
		{if $_modx->resource.services_videoshorts_ids}
		<div class="shorts">
			<div class="slider-container">
				<div class="shorts__slider swiper">
					<div class="swiper-wrapper">
						{$_modx->runSnippet('!pdoResources', [
							'parents' => 16,
							'resources' => $_modx->resource.services_videoshorts_ids,
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
		{set $services_goodinfo = json_decode($_modx->resource.id |resource: 'services_goodinfo', true)}
		{if $services_goodinfo}
		<div class="faq faq-js">
			<div class="container">
				<h2 class="main-heading">Article about</h2>
				<div class="faq__box">
					{foreach $services_goodinfo as $row}
					<div class="faq__item">
						<div class="faq__item-head jsTogglerHead">
							<h3 class="small-heading faq__item-name">{$row.services_goodinfo_title}</h3>
							<div class="faq__item-chevron">
								<svg width="28" height="18" viewBox="0 0 28 18" fill="none" xmlns="http://www.w3.org/2000/svg">
									<path d="M26.9053 1.82605C19.9679 5.09065 17.1955 7.96799 14.1812 14.9124C11.044 7.88705 8.21712 4.98609 1.09491 1.82605" stroke="white" stroke-width="2" />
								</svg>
							</div>
						</div>
						<div class="faq__item-body jsTogglerBody">
							<p>A: {$row.services_goodinfo_desc}</p>
						</div>
					</div>
					{/foreach}
				</div>
			</div>
		</div>
		{/if}
		{if $_modx->resource.services_doctor_id}
		{set $blog_doctor_img = $_modx->resource.services_doctor_id | resource: 'doctor_img'}
		{set $doctor_specialization = $_modx->resource.services_doctor_id | resource: 'doctor_specialization'}
		{set $doctor_experience = $_modx->resource.services_doctor_id | resource: 'doctor_experience'}
		<div class="controller">
			<div class="container">
				<div class="controller__inner">
					<div class="controller__img">
						<picture>
							<source srcset="{$_modx->runSnippet('!pThumb', ['input' => $blog_doctor_img, 'options' => '&w=257&h=257&f=webp&zc=1'])}" type="image/webp">
        					<img src="{$_modx->runSnippet('!pThumb', ['input' => $blog_doctor_img, 'options' => '&w=257&h=257&zc=1'])}" alt="">
						</picture>
					</div>
					<div class="controller__content">
						<p class="controller__head">The article has been checked by a doctor</p>
						<div class="controller__info">
							<h3 class="controller__name">{$_modx->resource.services_doctor_id | resource: 'pagetitle'}</h3>
							{if $doctor_specialization}<p class="controller__position">{$doctor_specialization}</p>{/if}
							{if $doctor_experience}<p class="controller__exp">{$doctor_experience}</p>{/if}
						</div>
						<a class="btn" href="{$_modx->resource.services_doctor_id | url}">See more</a>
					</div>
				</div>
			</div>
		</div>
		{/if}
		<div class="prices bottom-right-radius" id="prices">
			<div class="container">
				<h2 class="main-heading">Prices</h2>
				<div class="search-services__inner">
					<table class="search-table">
						{$_modx->runSnippet('!pdoResources', [
							'parents' => $_modx->resource.id,
							'depth' => 0,
							'limit' => 0,
							'includeTVs' => 'service_price',
							'tpl' => '@FILE chunks/work/service_price_tpl.tpl',
							'sortby' => 'menuindex',
							'sortdir' => 'asc'
						])}
					</table>
				</div>
			</div>
		</div>
		{if $_modx->resource.services_photos_ids}
		<div class="compare">
			<div class="container">
				<h2 class="main-heading">Before & after</h2>
				<div class="compare__inner">
					{$_modx->runSnippet('!pdoResources', [
						'parents' => 27,
						'resources' => $_modx->resource.services_photos_ids,
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
					<button class="btn compare-wish" href="#modal" data-fancybox>i wish</button>
				</div>
			</div>
		</div>
		{/if}
		<div class="reviews no-offset bottom-right-radius" id="reviews">
			<div class="container">
				<h2 class="main-heading">Reviews</h2>
				<div class="reviews__head">
					{$_modx->runSnippet('!countRating')}
					<span>[[!+total]] reviews</span>
				</div>
				<div class="reviews__content">
					{$_modx->runSnippet('!pdoResources', [
						'parents' => 2,
						'depth' => 0,
						'limit' => 3,
						'setTotal' => 1,
						'includeContent' => 1,
						'includeTVs' => 'review_date,review_link,review_rating',
						'tpl' => '@FILE chunks/work/home-reviews-inn.tpl',
						'sortby' => 'menuindex',
						'sortdir' => 'ASC'
					])}
				</div>
				<div class="centered-box">
					<a class="btn" href="{2 | url}">View more review</a>
				</div>
			</div>
		</div>
		{set $services_faq = json_decode($_modx->resource.id |resource: 'services_faq', true)}
		{if $services_faq}
		<div class="faq">
			<div class="container">
				<h2 class="main-heading">FAQ</h2>
				<div class="faq__box">
					{foreach $services_faq as $row}
					<div class="faq__item">
						<div class="faq__item-head jsTogglerHead">
							<h3 class="small-heading faq__item-name first-letter">Q: {$row.blog_faq_question}</h3>
							<div class="faq__item-chevron">
								<svg width="28" height="18" viewBox="0 0 28 18" fill="none" xmlns="http://www.w3.org/2000/svg">
									<path d="M26.9053 1.82605C19.9679 5.09065 17.1955 7.96799 14.1812 14.9124C11.044 7.88705 8.21712 4.98609 1.09491 1.82605" stroke="white" stroke-width="2" />
								</svg>
							</div>
						</div>
						<div class="faq__item-body jsTogglerBody">
							<p>A: {$row.blog_faq_answer}</p>
						</div>
					</div>
					{/foreach}
				</div>
			</div>
		</div>
		{/if}
		{if $_modx->resource.services_doctors_ids}
		<div class="specialist no-offset-bottom top-left-radius" id="specialists">
			<div class="container">
				<h2 class="main-heading">Doctors</h2>
			</div>
			<div class="slider-container">
				<div class="specialist__slider swiper">
					<div class="swiper-wrapper">
						{$_modx->runSnippet('!pdoResources', [
							'parents' => 31,
							'resources' => $_modx->resource.services_doctors_ids,
							'depth' => 0,
							'limit' => 10,
							'includeTVs' => 'doctor_specialization,doctor_img',
							'tpl' => '@FILE chunks/work/home_doctors_tpl.tpl',
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
		{if $_modx->resource.services_blogs_ids}
		<div class="articles no-offset" id="stocks">
			<div class="container">
				<h2 class="main-heading">Articles</h2>
			</div>
			<div class="slider-container">
				<div class="videos__slider swiper">
					<div class="swiper-wrapper">
						{$_modx->runSnippet('!pdoResources', [
							'parents' => 20,
							'resources' => $_modx->resource.services_blogs_ids,
							'depth' => 0,
							'limit' => 10,
							'includeTVs' => 'blog_img,blog_filter',
							'tpl' => '@FILE chunks/work/blog_row_inn.tpl',
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
				<div class="centered-box">
					<a class="btn" href="{20 | url}">See more</a>
				</div>
			</div>
		</div>
		{/if}
		{include 'file:chunks/work/consultation-feedback.tpl'}
	</main>
	{include 'file:chunks/main/footer.tpl'}
</body>
</html>