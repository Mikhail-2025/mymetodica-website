<!DOCTYPE html>
<html lang="en">
{include 'file:chunks/main/head.tpl'}
<body>
	{include 'file:chunks/main/header.tpl'}
	<main>
		<div class="blog-main">
			<div class="container">
				<h1>Metodica blog</h1>
				<div class="blog-main__inner">
					<div class="blog-main__content">
						<h2 class="main-heading text-left">{if $_modx->resource.longtitle}{$_modx->resource.longtitle}{else}{$_modx->resource.pagetitle}{/if}</h2>
						{if $_modx->resource.blog_start_text}
						<div class="blog-main__text">
							{$_modx->resource.blog_start_text}
						</div>
						{/if}
						{if $_modx->resource.blog_filter}
							<div class="blog-main__box">
							{var $filter = $_modx->resource.blog_filter | split:'||'}
							{foreach $filter as $row}
								<span class="blog-main__link">{$row}</span>
							{/foreach}
						</div>
						{/if}
					</div>
					<div class="blog-main__img">
						<picture>
							<source srcset="{$_modx->runSnippet('!pThumb', ['input' => $_modx->resource.blog_detal_img, 'options' => '&w=708&h=517&f=webp&zc=1'])}" type="image/webp">
							<img src="{$_modx->runSnippet('!pThumb', ['input' => $_modx->resource.blog_detal_img, 'options' => '&w=708&h=517&zc=1'])}" alt="">
						</picture>
					</div>
				</div>
			</div>
		</div>
		<div class="blog-content">
			<div class="container">
				<div class="blog-header">
					<div class="blog-header__inner">
						<div class="blog-header__main">
							{var $m_time = $_modx->resource.publishedon}
							<span>
								{$_modx->runSnippet('!dateRU', [
									'input_val' => 1,
									'm_time' => $m_time
								])}
							</span>
							{if $_modx->resource.blog_doctor_text}<span>Medically Reviewed by {$_modx->resource.blog_doctor_text}</span>{/if}
						</div>
						<div class="blog-header__box">
							<span>Follow</span>
							<div class="social blog-header__social">
								{set $soc_instagram = 1 | resource: 'soc_instagram'}
								{set $soc_facebook = 1 | resource: 'soc_facebook'}
								{set $soc_youtube = 1 | resource: 'soc_youtube'}
								{if $soc_instagram}
								<a class="social__item" href="{$soc_instagram}" target="_blank">
									<svg width="37" height="37" viewBox="0 0 37 37" fill="none" xmlns="http://www.w3.org/2000/svg">
										<circle cx="18.3421" cy="18.3421" r="18.3421" fill="#7A7599" />
										<path fill-rule="evenodd" clip-rule="evenodd" d="M13.4547 8.83919C12.2306 8.83919 11.0567 9.32546 10.1911 10.191C9.32551 11.0566 8.83923 12.2306 8.83923 13.4547V22.6857C8.83923 23.9098 9.32551 25.0838 10.1911 25.9493C11.0567 26.8149 12.2306 27.3012 13.4547 27.3012H22.6857C23.9098 27.3012 25.0838 26.8149 25.9494 25.9493C26.8149 25.0838 27.3012 23.9098 27.3012 22.6857V13.4547C27.3012 12.2306 26.8149 11.0566 25.9494 10.191C25.0838 9.32546 23.9098 8.83919 22.6857 8.83919H13.4547ZM18.0702 14.7135C17.18 14.7135 16.3262 15.0671 15.6967 15.6966C15.0672 16.3261 14.7135 17.1799 14.7135 18.0702C14.7135 18.9604 15.0672 19.8142 15.6967 20.4437C16.3262 21.0733 17.18 21.4269 18.0702 21.4269C18.9605 21.4269 19.8143 21.0733 20.4438 20.4437C21.0733 19.8142 21.427 18.9604 21.427 18.0702C21.427 17.1799 21.0733 16.3261 20.4438 15.6966C19.8143 15.0671 18.9605 14.7135 18.0702 14.7135ZM13.0351 18.0702C13.0351 16.7348 13.5656 15.4541 14.5099 14.5098C15.4541 13.5656 16.7348 13.0351 18.0702 13.0351C19.4056 13.0351 20.6863 13.5656 21.6306 14.5098C22.5748 15.4541 23.1053 16.7348 23.1053 18.0702C23.1053 19.4056 22.5748 20.6863 21.6306 21.6305C20.6863 22.5748 19.4056 23.1053 18.0702 23.1053C16.7348 23.1053 15.4541 22.5748 14.5099 21.6305C13.5656 20.6863 13.0351 19.4056 13.0351 18.0702ZM23.1053 11.3567C22.6602 11.3567 22.2333 11.5336 21.9185 11.8483C21.6038 12.1631 21.427 12.59 21.427 13.0351C21.427 13.4802 21.6038 13.9071 21.9185 14.2219C22.2333 14.5366 22.6602 14.7135 23.1053 14.7135C23.5504 14.7135 23.9773 14.5366 24.2921 14.2219C24.6069 13.9071 24.7837 13.4802 24.7837 13.0351C24.7837 12.59 24.6069 12.1631 24.2921 11.8483C23.9773 11.5336 23.5504 11.3567 23.1053 11.3567Z" fill="#F3F3F3" />
									</svg>
								</a>
								{/if}
								{if $soc_facebook}
								<a class="social__item" href="{$soc_facebook}" target="_blank">
									<svg width="38" height="37" viewBox="0 0 38 37" fill="none" xmlns="http://www.w3.org/2000/svg">
										<circle cx="19.0263" cy="18.3421" r="18.3421" fill="#7A7599" />
										<path d="M29.1404 18.0702C29.1404 12.508 24.6324 8 19.0702 8C13.508 8 9 12.508 9 18.0702C9 23.6324 13.508 28.1404 19.0702 28.1404C19.1292 28.1404 19.1882 28.1404 19.2472 28.1364V20.3006H17.0837V17.7791H19.2472V15.9224C19.2472 13.7707 20.561 12.5985 22.4807 12.5985C23.4011 12.5985 24.1918 12.6653 24.42 12.6968V14.9468H23.0982C22.0558 14.9468 21.8513 15.4425 21.8513 16.1702V17.7752H24.3492L24.0227 20.2966H21.8513V27.7509C26.0603 26.5433 29.1404 22.6686 29.1404 18.0702Z" fill="#F3F3F3" />
									</svg>
								</a>
								{/if}
								{if $soc_youtube}
								<a class="social__item" href="{$soc_youtube}" target="_blank">
									<svg width="38" height="37" viewBox="0 0 38 37" fill="none" xmlns="http://www.w3.org/2000/svg">
										<circle cx="18.7105" cy="18.3421" r="18.3421" fill="#7A7599" />
										<path d="M28.5688 13.4598C28.4593 12.5464 27.5986 11.6705 26.698 11.5532C21.2072 10.8708 15.6532 10.8708 10.1624 11.5532C9.26106 11.6703 8.40028 12.5464 8.29079 13.4598C7.90307 16.8073 7.90307 20.0531 8.29079 23.3999C8.40028 24.3133 9.26106 25.1899 10.1624 25.3065C15.6532 25.9888 21.2072 25.9888 26.698 25.3065C27.5986 25.1901 28.4593 24.3133 28.5688 23.3999C28.9566 20.0534 28.9566 16.8073 28.5688 13.4598ZM16.6914 21.9071V14.9536L21.9064 18.4305L16.6914 21.9071Z" fill="#F3F3F3" />
									</svg>
								</a>
								{/if}
							</div>
						</div>
					</div>
				</div>
				{if $_modx->resource.blog_one_text || $_modx->resource.blog_one_img}
				<div class="blog-row">
					<div class="blog-row__img">
						<picture>
							<source srcset="{$_modx->runSnippet('!pThumb', ['input' => $_modx->resource.blog_one_img, 'options' => '&w=632&h=372&f=webp&zc=1'])}" type="image/webp">
        					<img src="{$_modx->runSnippet('!pThumb', ['input' => $_modx->resource.blog_one_img, 'options' => '&w=632&h=372&zc=1'])}" alt="">
						</picture>
					</div>
					<div class="blog-row__content">
						{$_modx->resource.blog_one_text}
					</div>
				</div>
				{/if}
				{set $blog_goodinfo = json_decode($_modx->resource.id |resource: 'blog_goodinfo', true)}
				{if $blog_goodinfo}
				<div class="faq">
					<div class="faq__box">
						{foreach $blog_goodinfo as $row}
						<div class="faq__item">
							<div class="faq__item-head jsTogglerHead">
								<h3 class="small-heading faq__item-name">{$row.blog_goodinfo_title}</h3>
								<div class="faq__item-chevron">
									<svg width="28" height="18" viewBox="0 0 28 18" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path d="M26.9053 1.82605C19.9679 5.09065 17.1955 7.96799 14.1812 14.9124C11.044 7.88705 8.21712 4.98609 1.09491 1.82605" stroke="white" stroke-width="2" />
									</svg>
								</div>
							</div>
							<div class="faq__item-body jsTogglerBody">
								<p>A: {$row.blog_goodinfo_desc}</p>
							</div>
						</div>
						{/foreach}
					</div>
				</div>
				{/if}
				{if $_modx->resource.blog_two_text || $_modx->resource.blog_two_img}
				<div class="blog-row reverse">
					<div class="blog-row__img">
						<picture>
							<source srcset="{$_modx->runSnippet('!pThumb', ['input' => $_modx->resource.blog_two_img, 'options' => '&w=632&h=372&f=webp&zc=1'])}" type="image/webp">
        					<img src="{$_modx->runSnippet('!pThumb', ['input' => $_modx->resource.blog_two_img, 'options' => '&w=632&h=372&zc=1'])}" alt="">
						</picture>
					</div>
					<div class="blog-row__content">
						{$_modx->resource.blog_two_text}
					</div>
				</div>
				{/if}
			</div>
		</div>
		<div class="follow pink">
			<div class="container">
				<div class="follow__inner">
					<div class="follow__img">
						<img src="assets/templates/site/img/svg/follow-white.svg" alt="">
					</div>
					<div class="follow__content">
						<h2 class="main-heading">Get a consultation now</h2>
						<div class="centered-box">
							<button class="btn" href="#modal" data-fancybox>Call us</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		{if $_modx->resource.blog_photos_ids}
		<div class="compare">
			<div class="container">
				<h2 class="main-heading">Before & after</h2>
				<div class="compare__inner">
					{$_modx->runSnippet('!pdoResources', [
						'parents' => 27,
						'resources' => $_modx->resource.blog_photos_ids,
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
		{if $_modx->resource.blog_doctor_id}
		{set $blog_doctor_img = $_modx->resource.blog_doctor_id | resource: 'doctor_img'}
		{set $doctor_specialization = $_modx->resource.blog_doctor_id | resource: 'doctor_specialization'}
		{set $doctor_experience = $_modx->resource.blog_doctor_id | resource: 'doctor_experience'}
		<div class="controller has-bg top-left-radius">
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
							<h3 class="controller__name">{$_modx->resource.blog_doctor_id | resource: 'pagetitle'}</h3>
							{if $doctor_specialization}<p class="controller__position">{$doctor_specialization}</p>{/if}
							{if $doctor_experience}<p class="controller__exp">{$doctor_experience}</p>{/if}
						</div>
						<div class="controller__row">
							<a class="btn" href="{$_modx->resource.blog_doctor_id | url}">See more</a>
							<div class="blog-header__box">
								<span>Follow</span>
								<div class="social blog-header__social">
									{if $soc_instagram}
									<a class="social__item" href="{$soc_instagram}">
										<svg width="37" height="37" viewBox="0 0 37 37" fill="none" xmlns="http://www.w3.org/2000/svg">
											<circle cx="18.3421" cy="18.3421" r="18.3421" fill="#7A7599" />
											<path fill-rule="evenodd" clip-rule="evenodd" d="M13.4547 8.83919C12.2306 8.83919 11.0567 9.32546 10.1911 10.191C9.32551 11.0566 8.83923 12.2306 8.83923 13.4547V22.6857C8.83923 23.9098 9.32551 25.0838 10.1911 25.9493C11.0567 26.8149 12.2306 27.3012 13.4547 27.3012H22.6857C23.9098 27.3012 25.0838 26.8149 25.9494 25.9493C26.8149 25.0838 27.3012 23.9098 27.3012 22.6857V13.4547C27.3012 12.2306 26.8149 11.0566 25.9494 10.191C25.0838 9.32546 23.9098 8.83919 22.6857 8.83919H13.4547ZM18.0702 14.7135C17.18 14.7135 16.3262 15.0671 15.6967 15.6966C15.0672 16.3261 14.7135 17.1799 14.7135 18.0702C14.7135 18.9604 15.0672 19.8142 15.6967 20.4437C16.3262 21.0733 17.18 21.4269 18.0702 21.4269C18.9605 21.4269 19.8143 21.0733 20.4438 20.4437C21.0733 19.8142 21.427 18.9604 21.427 18.0702C21.427 17.1799 21.0733 16.3261 20.4438 15.6966C19.8143 15.0671 18.9605 14.7135 18.0702 14.7135ZM13.0351 18.0702C13.0351 16.7348 13.5656 15.4541 14.5099 14.5098C15.4541 13.5656 16.7348 13.0351 18.0702 13.0351C19.4056 13.0351 20.6863 13.5656 21.6306 14.5098C22.5748 15.4541 23.1053 16.7348 23.1053 18.0702C23.1053 19.4056 22.5748 20.6863 21.6306 21.6305C20.6863 22.5748 19.4056 23.1053 18.0702 23.1053C16.7348 23.1053 15.4541 22.5748 14.5099 21.6305C13.5656 20.6863 13.0351 19.4056 13.0351 18.0702ZM23.1053 11.3567C22.6602 11.3567 22.2333 11.5336 21.9185 11.8483C21.6038 12.1631 21.427 12.59 21.427 13.0351C21.427 13.4802 21.6038 13.9071 21.9185 14.2219C22.2333 14.5366 22.6602 14.7135 23.1053 14.7135C23.5504 14.7135 23.9773 14.5366 24.2921 14.2219C24.6069 13.9071 24.7837 13.4802 24.7837 13.0351C24.7837 12.59 24.6069 12.1631 24.2921 11.8483C23.9773 11.5336 23.5504 11.3567 23.1053 11.3567Z" fill="#F3F3F3" />
										</svg>
									</a>
									{/if}
									{if $soc_facebook}
									<a class="social__item" href="{$soc_facebook}">
										<svg width="38" height="37" viewBox="0 0 38 37" fill="none" xmlns="http://www.w3.org/2000/svg">
											<circle cx="19.0263" cy="18.3421" r="18.3421" fill="#7A7599" />
											<path d="M29.1404 18.0702C29.1404 12.508 24.6324 8 19.0702 8C13.508 8 9 12.508 9 18.0702C9 23.6324 13.508 28.1404 19.0702 28.1404C19.1292 28.1404 19.1882 28.1404 19.2472 28.1364V20.3006H17.0837V17.7791H19.2472V15.9224C19.2472 13.7707 20.561 12.5985 22.4807 12.5985C23.4011 12.5985 24.1918 12.6653 24.42 12.6968V14.9468H23.0982C22.0558 14.9468 21.8513 15.4425 21.8513 16.1702V17.7752H24.3492L24.0227 20.2966H21.8513V27.7509C26.0603 26.5433 29.1404 22.6686 29.1404 18.0702Z" fill="#F3F3F3" />
										</svg>
									</a>
									{/if}
									{if $soc_youtube}
									<a class="social__item" href="{$soc_youtube}">
										<svg width="38" height="37" viewBox="0 0 38 37" fill="none" xmlns="http://www.w3.org/2000/svg">
											<circle cx="18.7105" cy="18.3421" r="18.3421" fill="#7A7599" />
											<path d="M28.5688 13.4598C28.4593 12.5464 27.5986 11.6705 26.698 11.5532C21.2072 10.8708 15.6532 10.8708 10.1624 11.5532C9.26106 11.6703 8.40028 12.5464 8.29079 13.4598C7.90307 16.8073 7.90307 20.0531 8.29079 23.3999C8.40028 24.3133 9.26106 25.1899 10.1624 25.3065C15.6532 25.9888 21.2072 25.9888 26.698 25.3065C27.5986 25.1901 28.4593 24.3133 28.5688 23.3999C28.9566 20.0534 28.9566 16.8073 28.5688 13.4598ZM16.6914 21.9071V14.9536L21.9064 18.4305L16.6914 21.9071Z" fill="#F3F3F3" />
										</svg>
									</a>
									{/if}
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		{/if}
		<div class="reviews white-bg no-offset">
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
		{set $blog_faq = json_decode($_modx->resource.id |resource: 'blog_faq', true)}
		{if $blog_faq}
		<div class="faq faq-js">
			<div class="container">
				<h2 class="main-heading">FAQ</h2>
				<div class="faq__box">
					{foreach $blog_faq as $row}
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
		{include 'file:chunks/work/consultation-feedback.tpl'}
		{set $blog_price = json_decode($_modx->resource.id |resource: 'blog_price', true)}
		{if $blog_price}
		<div class="prices bottom-right-radius no-offset">
			<div class="container">
				<h2 class="main-heading">Prices</h2>
				<div class="search-services__inner">
					<table class="search-table">
						{foreach $blog_price as $row}
						<tr>
							<td data-cell="{$row.blog_price_val}">{$row.blog_price_title}</td>
							<td class="search-table__price">{$row.blog_price_val}</td>
							<td>
								<button class="btn {if $row.blog_price_discount}dark{/if}" href="#modal" data-fancybox>{if $row.blog_price_discount}Book now{else}Get a discount{/if}</button>
							</td>
						</tr>
						{/foreach}
					</table>
				</div>
			</div>
		</div>
		{/if}
		<div class="articles white-bg">
			<div class="container">
				<h2 class="main-heading">You might also like</h2>
			</div>
			<div class="slider-container">
				<div class="videos__slider swiper">
					<div class="swiper-wrapper">
						{$_modx->runSnippet('!pdoResources', [
							'parents' => 20,
							'depth' => 0,
							'limit' => 10,
							'resources' => '-'~$_modx->resource.id~'',
							'includeTVs' => 'blog_img,blog_filter',
							'tpl' => '@FILE chunks/work/blog_row_inn.tpl',
							'sortby'=> 'publishedon',
							'sortdir'=> 'desc',
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
				</div>
				<div class="centered-box">
					<a class="btn" href="{20 | url}">See more</a>
				</div>
			</div>
		</div>
	</main>
	{include 'file:chunks/main/footer.tpl'}
</body>
</html>