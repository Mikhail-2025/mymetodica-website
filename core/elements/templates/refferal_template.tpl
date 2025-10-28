<!DOCTYPE html>
<html lang="en">
{include 'file:chunks/main/head.tpl'}
<body>
	{include 'file:chunks/main/header.tpl'}
	<main>
		<div class="blog-main refferalmain">
			<div class="container">
				<div class="blog-main__inner referals">
					<div class="blog-main__content">
						<h1>{if $_modx->resource.longtitle}{$_modx->resource.longtitle}{else}{$_modx->resource.pagetitle}{/if}</h1>
						<h2 class="main-heading text-left">{$_modx->resource.introtext}</h2>
					</div>
					{if $_modx->resource.refferal_video}
					<div class="blog-main__img">
						<video src="{$_modx->resource.refferal_video}" autoplay muted loop playsinline></video> 
						
					</div>
					{/if}
				</div>
			</div>
		</div>
		<div class="stock-info">
			<div class="container">
				<div class="stock-info__inner">
					<div class="stock-info__content">
						{$_modx->resource.content}
						<div class="stock-info__buttons">
							{*if $_modx->resource.refferal_buynow}<a target="_blank" class="btn" href="{$_modx->resource.refferal_buynow}">Buy Now</a>{/if*}
							{if $_modx->resource.refferal_freeadvice}<a target="_blank" class="btn dark" href="{$_modx->resource.refferal_freeadvice}">Free Advice</a>{/if}
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
			</div>
		</div>
		{set $refferal_info = json_decode($_modx->resource.id |resource: 'refferal_info', true)}
		{* if $refferal_info}
		<div class="faq bg faq-js">
			<div class="container">
				<div class="faq__box">
					{foreach $refferal_info as $row}
					<div class="faq__item">
						<div class="faq__item-head jsTogglerHead">
							<h3 class="small-heading faq__item-name">{$row.refferal_info_title}</h3>
							<div class="faq__item-chevron">
								<svg width="28" height="18" viewBox="0 0 28 18" fill="none" xmlns="http://www.w3.org/2000/svg">
									<path d="M26.9053 1.82605C19.9679 5.09065 17.1955 7.96799 14.1812 14.9124C11.044 7.88705 8.21712 4.98609 1.09491 1.82605" stroke="white" stroke-width="2" />
								</svg>
							</div>
						</div>
						<div class="faq__item-body jsTogglerBody">
							<p>A: {$row.refferal_info_desc}</p>
						</div>
					</div>
					{/foreach}					
				</div>
				<div class="centered-box">
					<button class="btn" href="#modal" data-fancybox>Earn money</button>
				</div>
			</div>
		</div>
		{/if *}
	</main>
	{include 'file:chunks/main/footer.tpl'}
</body>
</html>