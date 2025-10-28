<!DOCTYPE html>
<html lang="en">
{include 'file:chunks/main/head.tpl'}
<body>
	{include 'file:chunks/main/header.tpl'}
	<main>
		<div class="stock-main">
			<div class="stock-main__img">
				<div class="container">
					<div class="stock-main__img-inner">
						<picture>
							<source srcset="{$_modx->runSnippet('!pThumb', ['input' => $_modx->resource.offer_img, 'options' => '&w=730&h=524&f=webp&zc=1'])}" type="image/webp">
							<img src="{$_modx->runSnippet('!pThumb', ['input' => $_modx->resource.offer_img, 'options' => '&w=730&h=524&zc=1'])}" alt="">
						</picture>
					</div>
				</div>
			</div>
			<div class="stock-main__content">
				<div class="container">
					<div class="stock-main__inner">
						<h2 class="main-heading text-left">{if $_modx->resource.longtitle}{$_modx->resource.longtitle}{else}{$_modx->resource.pagetitle}{/if}</h2>
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
			</div>
		</div>
		<div class="stock-info">
			<div class="container">
				{if $_modx->resource.offer_text}
				<div class="stock-info__inner">
					<div class="stock-info__content">
						{$_modx->resource.offer_text}
						<div class="stock-info__buttons">
							{* if $_modx->resource.offer_button_buynow}<a target="_blank" class="btn" href="{$_modx->resource.offer_button_buynow}">Buy Now</a>{/if *}
							<a target="_blank" class="btn dark" href="https://n1239285.alteg.io">Free Advice</a>
						</div>
					</div>
					{*
					<div class="stock-info__img">
						<picture>
							<source srcset="assets/templates/site/img/webp/stock-info@x2.webp" type="image/webp">
							<img src="assets/templates/site/img/stock-info@x2.png" alt="">
						</picture>
					</div>
					*}
				</div>
				{/if}
			</div>
		</div>
		{include 'file:chunks/work/consultation-feedback.tpl'}
		<div class="articles white-bg">
			<div class="container">
				<h2 class="main-heading">You might also like</h2>
			</div>
			<div class="slider-container">
				<div class="videos__slider swiper">
					<div class="swiper-wrapper">
						{$_modx->runSnippet('!pdoResources', [
							'parents' => 37,
							'depth' => 0,
							'limit' => 10,
							'resources' => '-'~$_modx->resource.id~'',
							'includeTVs' => 'offer_img',
							'tpl' => '@FILE chunks/work/offer_row_inn.tpl',
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
					<div class="swiper-pagination"></div>
				</div>
				<div class="centered-box">
					<a class="btn" href="{37 | url}">See more</a>
				</div>
			</div>
		</div>
	</main>
	{include 'file:chunks/main/footer.tpl'}
</body>
</html>