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


		<div class="articles bottom-right-radius">
			<div class="container">
				<h2 class="main-heading">Articles</h2>
			</div>
			<div class="slider-container">
				<div class="videos__slider swiper">
					<div class="swiper-wrapper">
						<article class="articles__item swiper-slide">
							<a href="#">
								<div class="articles__item-img">
									<picture>
										<source srcset="assets/templates/site/img/webp/a-1@x2.webp" type="image/webp">
										<img src="assets/templates/site/img/a-1@x2.jpg" alt="">
									</picture>
								</div>
								<div class="articles__item-body">
									<h3 class="articles__item-name">Botox: How Much Should It Cost?</h3>
									<p>Price structuring. It determines the areas you treat how far your dollar goes…</p>
								</div>
							</a>
						</article>
						<article class="articles__item swiper-slide">
							<a href="#">
								<div class="articles__item-img">
									<picture>
										<source srcset="assets/templates/site/img/webp/a-2@x2.webp" type="image/webp">
										<img src="assets/templates/site/img/a-2@x2.jpg" alt="">
									</picture>
								</div>
								<div class="articles__item-body">
									<h3 class="articles__item-name">Botox: How Much Should It Cost?</h3>
									<p>Price structuring. It determines the areas you treat how far your dollar goes…</p>
								</div>
							</a>
						</article>
						<article class="articles__item swiper-slide">
							<a href="#">
								<div class="articles__item-img">
									<picture>
										<source srcset="assets/templates/site/img/webp/a-3@x2.webp" type="image/webp">
										<img src="assets/templates/site/img/a-3@x2.jpg" alt="">
									</picture>
								</div>
								<div class="articles__item-body">
									<h3 class="articles__item-name">Botox: How Much Should It Cost?</h3>
									<p>Price structuring. It determines the areas you treat how far your dollar goes…</p>
								</div>
							</a>
						</article>
						<article class="articles__item swiper-slide">
							<a href="#">
								<div class="articles__item-img">
									<picture>
										<source srcset="assets/templates/site/img/webp/a-1@x2.webp" type="image/webp">
										<img src="assets/templates/site/img/a-1@x2.jpg" alt="">
									</picture>
								</div>
								<div class="articles__item-body">
									<h3 class="articles__item-name">Botox: How Much Should It Cost?</h3>
									<p>Price structuring. It determines the areas you treat how far your dollar goes…</p>
								</div>
							</a>
						</article>
						<article class="articles__item swiper-slide">
							<a href="#">
								<div class="articles__item-img">
									<picture>
										<source srcset="assets/templates/site/img/webp/a-2@x2.webp" type="image/webp">
										<img src="assets/templates/site/img/a-2@x2.jpg" alt="">
									</picture>
								</div>
								<div class="articles__item-body">
									<h3 class="articles__item-name">Botox: How Much Should It Cost?</h3>
									<p>Price structuring. It determines the areas you treat how far your dollar goes…</p>
								</div>
							</a>
						</article>
						<article class="articles__item swiper-slide">
							<a href="#">
								<div class="articles__item-img">
									<picture>
										<source srcset="assets/templates/site/img/webp/a-3@x2.webp" type="image/webp">
										<img src="assets/templates/site/img/a-3@x2.jpg" alt="">
									</picture>
								</div>
								<div class="articles__item-body">
									<h3 class="articles__item-name">Botox: How Much Should It Cost?</h3>
									<p>Price structuring. It determines the areas you treat how far your dollar goes…</p>
								</div>
							</a>
						</article>
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
					<a class="btn" href="#">See more</a>
				</div>
			</div>
		</div>
		<div class="videos">
			<div class="container">
				<h2 class="main-heading">Videos</h2>
			</div>
			<div class="slider-container">
				<div class="videos__slider swiper">
					<div class="swiper-wrapper">
						<div class="video-card swiper-slide">
							<a class="video-card__head" href="https://www.youtube.com/watch?v=QZJAomVKyLo" data-fancybox>
								<picture>
									<source srcset="assets/templates/site/img/webp/av@x2.webp" type="image/webp">
									<img src="assets/templates/site/img/av@x2.jpg" alt="">
								</picture>
								<div class="play-btn">
									<svg width="67" height="67" viewBox="0 0 67 67" fill="none" xmlns="http://www.w3.org/2000/svg">
										<g>
											<circle cx="33.5" cy="33.5" r="33.5" fill="#7A7599" fill-opacity="0.8" />
										</g>
										<path d="M22.75 31.5002L22.75 45.1915C22.75 46.7311 24.4167 47.6934 25.75 46.9236L46 35.2322C47.3333 34.4624 47.3333 32.5379 46 31.7681L28.5 21.6645L25.75 20.0768C24.4167 19.307 22.75 20.2692 22.75 21.8088L22.75 25.0002" stroke="white" />
										<defs>
											<filter x="-10" y="-10" width="87" height="87" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
												<feFlood flood-opacity="0" result="BackgroundImageFix" />
												<feGaussianBlur in="BackgroundImageFix" stdDeviation="5" />
												<feComposite in2="SourceAlpha" operator="in" result="effect1_backgroundBlur_2014_2376" />
												<feBlend mode="normal" in="SourceGraphic" in2="effect1_backgroundBlur_2014_2376" result="shape" />
											</filter>
										</defs>
									</svg>
								</div>
							</a>
							<div class="video-card__body">
								<b>Filler augmentation</b>
							</div>
						</div>
						<div class="video-card swiper-slide">
							<a class="video-card__head" href="https://www.youtube.com/watch?v=QZJAomVKyLo" data-fancybox>
								<picture>
									<source srcset="assets/templates/site/img/webp/av@x2.webp" type="image/webp">
									<img src="assets/templates/site/img/av@x2.jpg" alt="">
								</picture>
								<div class="play-btn">
									<svg width="67" height="67" viewBox="0 0 67 67" fill="none" xmlns="http://www.w3.org/2000/svg">
										<g>
											<circle cx="33.5" cy="33.5" r="33.5" fill="#7A7599" fill-opacity="0.8" />
										</g>
										<path d="M22.75 31.5002L22.75 45.1915C22.75 46.7311 24.4167 47.6934 25.75 46.9236L46 35.2322C47.3333 34.4624 47.3333 32.5379 46 31.7681L28.5 21.6645L25.75 20.0768C24.4167 19.307 22.75 20.2692 22.75 21.8088L22.75 25.0002" stroke="white" />
										<defs>
											<filter x="-10" y="-10" width="87" height="87" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
												<feFlood flood-opacity="0" result="BackgroundImageFix" />
												<feGaussianBlur in="BackgroundImageFix" stdDeviation="5" />
												<feComposite in2="SourceAlpha" operator="in" result="effect1_backgroundBlur_2014_2376" />
												<feBlend mode="normal" in="SourceGraphic" in2="effect1_backgroundBlur_2014_2376" result="shape" />
											</filter>
										</defs>
									</svg>
								</div>
							</a>
							<div class="video-card__body">
								<b>Filler augmentation</b>
							</div>
						</div>
						<div class="video-card swiper-slide">
							<a class="video-card__head" href="https://www.youtube.com/watch?v=QZJAomVKyLo" data-fancybox>
								<picture>
									<source srcset="assets/templates/site/img/webp/av@x2.webp" type="image/webp">
									<img src="assets/templates/site/img/av@x2.jpg" alt="">
								</picture>
								<div class="play-btn">
									<svg width="67" height="67" viewBox="0 0 67 67" fill="none" xmlns="http://www.w3.org/2000/svg">
										<g>
											<circle cx="33.5" cy="33.5" r="33.5" fill="#7A7599" fill-opacity="0.8" />
										</g>
										<path d="M22.75 31.5002L22.75 45.1915C22.75 46.7311 24.4167 47.6934 25.75 46.9236L46 35.2322C47.3333 34.4624 47.3333 32.5379 46 31.7681L28.5 21.6645L25.75 20.0768C24.4167 19.307 22.75 20.2692 22.75 21.8088L22.75 25.0002" stroke="white" />
										<defs>
											<filter x="-10" y="-10" width="87" height="87" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
												<feFlood flood-opacity="0" result="BackgroundImageFix" />
												<feGaussianBlur in="BackgroundImageFix" stdDeviation="5" />
												<feComposite in2="SourceAlpha" operator="in" result="effect1_backgroundBlur_2014_2376" />
												<feBlend mode="normal" in="SourceGraphic" in2="effect1_backgroundBlur_2014_2376" result="shape" />
											</filter>
										</defs>
									</svg>
								</div>
							</a>
							<div class="video-card__body">
								<b>Filler augmentation</b>
							</div>
						</div>
						<div class="video-card swiper-slide">
							<a class="video-card__head" href="https://www.youtube.com/watch?v=QZJAomVKyLo" data-fancybox>
								<picture>
									<source srcset="assets/templates/site/img/webp/av@x2.webp" type="image/webp">
									<img src="assets/templates/site/img/av@x2.jpg" alt="">
								</picture>
								<div class="play-btn">
									<svg width="67" height="67" viewBox="0 0 67 67" fill="none" xmlns="http://www.w3.org/2000/svg">
										<g>
											<circle cx="33.5" cy="33.5" r="33.5" fill="#7A7599" fill-opacity="0.8" />
										</g>
										<path d="M22.75 31.5002L22.75 45.1915C22.75 46.7311 24.4167 47.6934 25.75 46.9236L46 35.2322C47.3333 34.4624 47.3333 32.5379 46 31.7681L28.5 21.6645L25.75 20.0768C24.4167 19.307 22.75 20.2692 22.75 21.8088L22.75 25.0002" stroke="white" />
										<defs>
											<filter x="-10" y="-10" width="87" height="87" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
												<feFlood flood-opacity="0" result="BackgroundImageFix" />
												<feGaussianBlur in="BackgroundImageFix" stdDeviation="5" />
												<feComposite in2="SourceAlpha" operator="in" result="effect1_backgroundBlur_2014_2376" />
												<feBlend mode="normal" in="SourceGraphic" in2="effect1_backgroundBlur_2014_2376" result="shape" />
											</filter>
										</defs>
									</svg>
								</div>
							</a>
							<div class="video-card__body">
								<b>Filler augmentation</b>
							</div>
						</div>
						<div class="video-card swiper-slide">
							<a class="video-card__head" href="https://www.youtube.com/watch?v=QZJAomVKyLo" data-fancybox>
								<picture>
									<source srcset="assets/templates/site/img/webp/av@x2.webp" type="image/webp">
									<img src="assets/templates/site/img/av@x2.jpg" alt="">
								</picture>
								<div class="play-btn">
									<svg width="67" height="67" viewBox="0 0 67 67" fill="none" xmlns="http://www.w3.org/2000/svg">
										<g>
											<circle cx="33.5" cy="33.5" r="33.5" fill="#7A7599" fill-opacity="0.8" />
										</g>
										<path d="M22.75 31.5002L22.75 45.1915C22.75 46.7311 24.4167 47.6934 25.75 46.9236L46 35.2322C47.3333 34.4624 47.3333 32.5379 46 31.7681L28.5 21.6645L25.75 20.0768C24.4167 19.307 22.75 20.2692 22.75 21.8088L22.75 25.0002" stroke="white" />
										<defs>
											<filter x="-10" y="-10" width="87" height="87" filterUnits="userSpaceOnUse" color-interpolation-filters="sRGB">
												<feFlood flood-opacity="0" result="BackgroundImageFix" />
												<feGaussianBlur in="BackgroundImageFix" stdDeviation="5" />
												<feComposite in2="SourceAlpha" operator="in" result="effect1_backgroundBlur_2014_2376" />
												<feBlend mode="normal" in="SourceGraphic" in2="effect1_backgroundBlur_2014_2376" result="shape" />
											</filter>
										</defs>
									</svg>
								</div>
							</a>
							<div class="video-card__body">
								<b>Filler augmentation</b>
							</div>
						</div>
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
		<div class="shorts">
			<div class="slider-container">
				<div class="shorts__slider swiper">
					<div class="swiper-wrapper">
						<div class="shorts__slider-item swiper-slide jsOpenShort" data-url="video/short.mp4">
							<div class="play-btn has-decor">
								<svg width="72" height="72" viewBox="0 0 72 73" fill="none" xmlns="http://www.w3.org/2000/svg">
									<circle cx="36" cy="36.7046" r="36" fill="#F9F9F9" fill-opacity="0.8" />
									<path d="M51.5 36.8386C52.1667 37.2235 52.1667 38.1857 51.5 38.5706L29 51.561C28.3333 51.9459 27.5 51.4648 27.5 50.695L27.5 24.7142C27.5 23.9444 28.3333 23.4633 29 23.8482L51.5 36.8386Z" fill="#EA6852" />
								</svg>
							</div>
							<div class="shorts__slider-img">
								<picture>
									<source srcset="assets/templates/site/img/webp/short@x2.webp" type="image/webp">
									<img src="assets/templates/site/img/short@x2.jpg" alt="">
								</picture>
							</div>
							<div class="shorts__slider-name">Laser hair removal </div>
						</div>
						<div class="shorts__slider-item swiper-slide jsOpenShort" data-url="video/short.mp4">
							<div class="play-btn has-decor">
								<svg width="72" height="72" viewBox="0 0 72 73" fill="none" xmlns="http://www.w3.org/2000/svg">
									<circle cx="36" cy="36.7046" r="36" fill="#F9F9F9" fill-opacity="0.8" />
									<path d="M51.5 36.8386C52.1667 37.2235 52.1667 38.1857 51.5 38.5706L29 51.561C28.3333 51.9459 27.5 51.4648 27.5 50.695L27.5 24.7142C27.5 23.9444 28.3333 23.4633 29 23.8482L51.5 36.8386Z" fill="#EA6852" />
								</svg>
							</div>
							<div class="shorts__slider-img">
								<picture>
									<source srcset="assets/templates/site/img/webp/short@x2.webp" type="image/webp">
									<img src="assets/templates/site/img/short@x2.jpg" alt="">
								</picture>
							</div>
							<div class="shorts__slider-name">Laser hair removal </div>
						</div>
						<div class="shorts__slider-item swiper-slide jsOpenShort" data-url="video/short.mp4">
							<div class="play-btn has-decor">
								<svg width="72" height="72" viewBox="0 0 72 73" fill="none" xmlns="http://www.w3.org/2000/svg">
									<circle cx="36" cy="36.7046" r="36" fill="#F9F9F9" fill-opacity="0.8" />
									<path d="M51.5 36.8386C52.1667 37.2235 52.1667 38.1857 51.5 38.5706L29 51.561C28.3333 51.9459 27.5 51.4648 27.5 50.695L27.5 24.7142C27.5 23.9444 28.3333 23.4633 29 23.8482L51.5 36.8386Z" fill="#EA6852" />
								</svg>
							</div>
							<div class="shorts__slider-img">
								<picture>
									<source srcset="assets/templates/site/img/webp/short@x2.webp" type="image/webp">
									<img src="assets/templates/site/img/short@x2.jpg" alt="">
								</picture>
							</div>
							<div class="shorts__slider-name">Laser hair removal </div>
						</div>
						<div class="shorts__slider-item swiper-slide jsOpenShort" data-url="video/short.mp4">
							<div class="play-btn has-decor">
								<svg width="72" height="72" viewBox="0 0 72 73" fill="none" xmlns="http://www.w3.org/2000/svg">
									<circle cx="36" cy="36.7046" r="36" fill="#F9F9F9" fill-opacity="0.8" />
									<path d="M51.5 36.8386C52.1667 37.2235 52.1667 38.1857 51.5 38.5706L29 51.561C28.3333 51.9459 27.5 51.4648 27.5 50.695L27.5 24.7142C27.5 23.9444 28.3333 23.4633 29 23.8482L51.5 36.8386Z" fill="#EA6852" />
								</svg>
							</div>
							<div class="shorts__slider-img">
								<picture>
									<source srcset="assets/templates/site/img/webp/short@x2.webp" type="image/webp">
									<img src="assets/templates/site/img/short@x2.jpg" alt="">
								</picture>
							</div>
							<div class="shorts__slider-name">Laser hair removal </div>
						</div>
						<div class="shorts__slider-item swiper-slide jsOpenShort" data-url="video/short.mp4">
							<div class="play-btn has-decor">
								<svg width="72" height="72" viewBox="0 0 72 73" fill="none" xmlns="http://www.w3.org/2000/svg">
									<circle cx="36" cy="36.7046" r="36" fill="#F9F9F9" fill-opacity="0.8" />
									<path d="M51.5 36.8386C52.1667 37.2235 52.1667 38.1857 51.5 38.5706L29 51.561C28.3333 51.9459 27.5 51.4648 27.5 50.695L27.5 24.7142C27.5 23.9444 28.3333 23.4633 29 23.8482L51.5 36.8386Z" fill="#EA6852" />
								</svg>
							</div>
							<div class="shorts__slider-img">
								<picture>
									<source srcset="assets/templates/site/img/webp/short@x2.webp" type="image/webp">
									<img src="assets/templates/site/img/short@x2.jpg" alt="">
								</picture>
							</div>
							<div class="shorts__slider-name">Laser hair removal </div>
						</div>
						<div class="shorts__slider-item swiper-slide jsOpenShort" data-url="video/short.mp4">
							<div class="play-btn has-decor">
								<svg width="72" height="72" viewBox="0 0 72 73" fill="none" xmlns="http://www.w3.org/2000/svg">
									<circle cx="36" cy="36.7046" r="36" fill="#F9F9F9" fill-opacity="0.8" />
									<path d="M51.5 36.8386C52.1667 37.2235 52.1667 38.1857 51.5 38.5706L29 51.561C28.3333 51.9459 27.5 51.4648 27.5 50.695L27.5 24.7142C27.5 23.9444 28.3333 23.4633 29 23.8482L51.5 36.8386Z" fill="#EA6852" />
								</svg>
							</div>
							<div class="shorts__slider-img">
								<picture>
									<source srcset="assets/templates/site/img/webp/short@x2.webp" type="image/webp">
									<img src="assets/templates/site/img/short@x2.jpg" alt="">
								</picture>
							</div>
							<div class="shorts__slider-name">Laser hair removal </div>
						</div>
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
				<a class="btn" href="#">See more</a>
			</div>
		</div>
	</main>
	{include 'file:chunks/main/footer.tpl'}
	<script src="assets/templates/site/js/filter-scripts.js"></script>
</body>
</html>