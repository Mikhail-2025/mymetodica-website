{set $home_slider = json_decode(1 |resource: 'home_slider', true)}
{if $home_slider}

<div class="main-screen swiper">
	<div class="swiper-wrapper">
		{foreach $home_slider as $row}
		<div class="main-screen__item swiper-slide">
			<div class="main-screen__image">
				<picture>
					<source media="(max-width: 768px)" srcset="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.home_slider_img_mobile~'', 'options' => '&w=750&h=864&f=webp'])}" type="image/webp">
					<source media="(max-width: 768px)" srcset="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.home_slider_img_mobile~'', 'options' => '&w=750&h=864&zc=1'])}">
					<source srcset="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.home_slider_img_pc~'', 'options' => '&w=3840&h=1256&f=webp'])}" type="image/webp">
					<img src="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.home_slider_img_pc~'', 'options' => '&w=3840&h=1256&zc=1'])}" alt="">
				</picture>
			</div>
			<div class="main-screen__content">
				<div class="container">
					<div class="main-screen__inner">
						<h2 class="main-screen__heading">{$row.home_slider_title}</h2>
						<div class="main-screen__descr">
							{$row.home_slider_desc}
						</div>
						{if $row.home_slider_link}
						<div class="main-screen__buttons">
							<a target="_blank" class="btn" href="{$row.home_slider_link}">Рay now</a>
						</div>
						{/if}
					</div>
				</div>
			</div>
		</div>
		{/foreach}
	</div>
	<div class="main-screen__controls">
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
</div>
{/if}