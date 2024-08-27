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
		<div class="about-info bottom-right-radius">
			<div class="container">
				<div class="about-info__item">
					<h2 class="main-heading">Skin diagnostics with canfield visia</h2>
					<div class="about-info__inner">
						<div class="about-info__img high-radius-img">
							<picture>
								<source srcset="assets/templates/site/img/webp/ai-1@x2.webp" type="image/webp">
								<img src="assets/templates/site/img/ai-1@x2.jpg" alt="">
							</picture>
						</div>
						<div class="about-info__text">
							<p>QUANTITATIVE ANALYSIS AND VISUAL ASSESSMENT WITH CANFIELD Visia CANFIELD Visia is a unique device that provides the ability to determine the overall health and age of the skin, revealing a revolutionary new metric to help select skin care products and treatment options. The new design of the rotating photography module significantly simplifies and improves the process of capturing photographs at standard viewing angles (45° and 90°), and also provides uniform diffuse illumination for exceptional clarity and clarity of skin structure details.</p>
						</div>
					</div>
				</div>
				<div class="about-info__item">
					<h2 class="main-heading">Skin rejuvenation with Vectra M22</h2>
					<div class="about-info__inner">
						<div class="about-info__img high-radius-img">
							<picture>
								<source srcset="assets/templates/site/img/webp/ai-2@x2.webp" type="image/webp">
								<img src="assets/templates/site/img/ai-2@x2.jpg" alt="">
							</picture>
						</div>
						<div class="about-info__text">
							<p>Procedures using the M22 device are classics of modern cosmetology. This hardware complex helps to quickly and effectively solve the most common skin problems. Thanks to the combination and active use of three modules at once: IPL technology (photorejuvenation) and two types of laser, you can get rid of acne, unwanted pigmentation, spider veins or the first signs of aging.</p>
						</div>
					</div>
				</div>
				<div class="about-info__item">
					<h2 class="main-heading">M22 by Lumenis</h2>
					<div class="about-info__inner">
						<div class="about-info__img high-radius-img">
							<picture>
								<source srcset="assets/templates/site/img/webp/ai-3@x2.webp" type="image/webp">
								<img src="assets/templates/site/img/ai-3@x2.jpg" alt="">
							</picture>
						</div>
						<div class="about-info__text">
							<p>QUANTITATIVE ANALYSIS AND VISUAL ASSESSMENT WITH CANFIELD Visia CANFIELD Visia is a unique device that provides the ability to determine the overall health and age of the skin, revealing a revolutionary new metric to help select skin care products and treatment options. The new design of the rotating photography module significantly simplifies and improves the process of capturing photographs at standard viewing angles (45° and 90°), and also provides uniform diffuse illumination for exceptional clarity and clarity of skin structure details.</p>
						</div>
					</div>
				</div>
				<div class="about-info__item">
					<h2 class="main-heading">Legend Pro by Lumenis and Ulthera System</h2>
					<div class="about-info__inner">
						<div class="about-info__img high-radius-img">
							<picture>
								<source srcset="assets/templates/site/img/webp/ai-4@x2.webp" type="image/webp">
								<img src="assets/templates/site/img/ai-4@x2.jpg" alt="">
							</picture>
						</div>
						<div class="about-info__text">
							<p>Procedures using the M22 device are classics of modern cosmetology. This hardware complex helps to quickly and effectively solve the most common skin problems. Thanks to the combination and active use of three modules at once: IPL technology (photorejuvenation) and two types of laser, you can get rid of acne, unwanted pigmentation, spider veins or the first signs of aging.</p>
						</div>
					</div>
				</div>
				<div class="about-info__item">
					<h2 class="main-heading">Splendor X by Lumenis</h2>
					<div class="about-info__inner">
						<div class="about-info__img high-radius-img">
							<picture>
								<source srcset="assets/templates/site/img/webp/ai-5@x2.webp" type="image/webp">
								<img src="assets/templates/site/img/ai-5@x2.jpg" alt="">
							</picture>
						</div>
						<div class="about-info__text">
							<p>QUANTITATIVE ANALYSIS AND VISUAL ASSESSMENT WITH CANFIELD Visia CANFIELD Visia is a unique device that provides the ability to determine the overall health and age of the skin, revealing a revolutionary new metric to help select skin care products and treatment options. The new design of the rotating photography module significantly simplifies and improves the process of capturing photographs at standard viewing angles (45° and 90°), and also provides uniform diffuse illumination for exceptional clarity and clarity of skin structure details.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="clinic">
			<div class="container">
				<h2 class="main-heading">Our clinic</h2>
			</div>
			<div class="slider-container">
				<div class="clinic__slider swiper">
					<div class="swiper-wrapper">
						<a class="clinic__slider-item swiper-slide" href="assets/templates/site/img/cl-1@x2.png" data-fancybox="clinic">
							<picture>
								<source srcset="assets/templates/site/img/webp/cl-1@x2.webp" type="image/webp">
								<img src="assets/templates/site/img/cl-1@x2.png" alt="">
							</picture>
						</a>
						<a class="clinic__slider-item swiper-slide" href="assets/templates/site/img/cl-2@x2.png" data-fancybox="clinic">
							<picture>
								<source srcset="assets/templates/site/img/webp/cl-2@x2.webp" type="image/webp">
								<img src="assets/templates/site/img/cl-2@x2.png" alt="">
							</picture>
						</a>
						<a class="clinic__slider-item swiper-slide" href="assets/templates/site/img/cl-3@x2.png" data-fancybox="clinic">
							<picture>
								<source srcset="assets/templates/site/img/webp/cl-3@x2.webp" type="image/webp">
								<img src="assets/templates/site/img/cl-3@x2.png" alt="">
							</picture>
						</a>
						<a class="clinic__slider-item swiper-slide" href="assets/templates/site/img/cl-4@x2.png" data-fancybox="clinic">
							<picture>
								<source srcset="assets/templates/site/img/webp/cl-4@x2.webp" type="image/webp">
								<img src="assets/templates/site/img/cl-4@x2.png" alt="">
							</picture>
						</a>
						<a class="clinic__slider-item swiper-slide" href="assets/templates/site/img/cl-1@x2.png" data-fancybox="clinic">
							<picture>
								<source srcset="assets/templates/site/img/webp/cl-1@x2.webp" type="image/webp">
								<img src="assets/templates/site/img/cl-1@x2.png" alt="">
							</picture>
						</a>
						<a class="clinic__slider-item swiper-slide" href="assets/templates/site/img/cl-2@x2.png" data-fancybox="clinic">
							<picture>
								<source srcset="assets/templates/site/img/webp/cl-2@x2.webp" type="image/webp">
								<img src="assets/templates/site/img/cl-2@x2.png" alt="">
							</picture>
						</a>
						<a class="clinic__slider-item swiper-slide" href="assets/templates/site/img/cl-3@x2.png" data-fancybox="clinic">
							<picture>
								<source srcset="assets/templates/site/img/webp/cl-3@x2.webp" type="image/webp">
								<img src="assets/templates/site/img/cl-3@x2.png" alt="">
							</picture>
						</a>
						<a class="clinic__slider-item swiper-slide" href="assets/templates/site/img/cl-4@x2.png" data-fancybox="clinic">
							<picture>
								<source srcset="assets/templates/site/img/webp/cl-4@x2.webp" type="image/webp">
								<img src="assets/templates/site/img/cl-4@x2.png" alt="">
							</picture>
						</a>
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
		<div class="follow">
			<div class="container">
				<div class="follow__inner">
					<div class="follow__img">
						<img src="assets/templates/site/img/svg/follow.svg" alt="">
					</div>
					<div class="follow__content">
						<h2 class="main-heading">Follow us</h2>
						<div class="follow__social">
							<a class="follow__social-item" href="instagram.com/metodica.medspa" target="_blank">
								<svg width="83" height="84" viewBox="0 0 83 84" fill="none" xmlns="http://www.w3.org/2000/svg">
									<circle cx="41.4561" cy="41.9522" r="41.4561" fill="#7A7599" />
									<path fill-rule="evenodd" clip-rule="evenodd" d="M31.8372 20.2754C29.0706 20.2754 26.4172 21.3744 24.4609 23.3308C22.5045 25.2871 21.4055 27.9405 21.4055 30.7072V51.5707C21.4055 54.3374 22.5045 56.9908 24.4609 58.9471C26.4172 60.9034 29.0706 62.0025 31.8372 62.0025H52.7008C55.4675 62.0025 58.1208 60.9034 60.0772 58.9471C62.0335 56.9908 63.1326 54.3374 63.1326 51.5707V30.7072C63.1326 27.9405 62.0335 25.2871 60.0772 23.3308C58.1208 21.3744 55.4675 20.2754 52.7008 20.2754H31.8372ZM42.269 33.5522C40.2569 33.5522 38.3272 34.3515 36.9044 35.7743C35.4816 37.1971 34.6823 39.1268 34.6823 41.1389C34.6823 43.1511 35.4816 45.0808 36.9044 46.5036C38.3272 47.9264 40.2569 48.7257 42.269 48.7257C44.2811 48.7257 46.2109 47.9264 47.6336 46.5036C49.0564 45.0808 49.8558 43.1511 49.8558 41.1389C49.8558 39.1268 49.0564 37.1971 47.6336 35.7743C46.2109 34.3515 44.2811 33.5522 42.269 33.5522ZM30.8889 41.1389C30.8889 38.1207 32.0879 35.2262 34.222 33.092C36.3562 30.9578 39.2508 29.7588 42.269 29.7588C45.2872 29.7588 48.1818 30.9578 50.316 33.092C52.4502 35.2262 53.6491 38.1207 53.6491 41.1389C53.6491 44.1571 52.4502 47.0517 50.316 49.1859C48.1818 51.3201 45.2872 52.5191 42.269 52.5191C39.2508 52.5191 36.3562 51.3201 34.222 49.1859C32.0879 47.0517 30.8889 44.1571 30.8889 41.1389ZM53.6491 25.9654C52.6431 25.9654 51.6782 26.3651 50.9668 27.0765C50.2554 27.7879 49.8558 28.7528 49.8558 29.7588C49.8558 30.7649 50.2554 31.7297 50.9668 32.4411C51.6782 33.1525 52.6431 33.5522 53.6491 33.5522C54.6552 33.5522 55.62 33.1525 56.3314 32.4411C57.0428 31.7297 57.4425 30.7649 57.4425 29.7588C57.4425 28.7528 57.0428 27.7879 56.3314 27.0765C55.62 26.3651 54.6552 25.9654 53.6491 25.9654Z" fill="#F3F3F3" />
								</svg>
							</a>
							<a class="follow__social-item" href="https://www.facebook.com/profile.php?id=100086432255121" target="_blank">
								<svg width="84" height="84" viewBox="0 0 84 84" fill="none" xmlns="http://www.w3.org/2000/svg">
									<circle cx="42.3684" cy="41.9522" r="41.4561" fill="#7A7599" />
									<path d="M65.9415 41.1391C65.9415 28.5677 55.7528 18.3789 43.1813 18.3789C30.6098 18.3789 20.4211 28.5677 20.4211 41.1391C20.4211 53.7106 30.6098 63.8994 43.1813 63.8994C43.3146 63.8994 43.448 63.8994 43.5814 63.8905V46.1802H38.6915V40.4812H43.5814V36.2848C43.5814 31.4216 46.5509 28.7722 50.8895 28.7722C52.97 28.7722 54.757 28.9233 55.2727 28.9944V34.0799H52.2854C49.9293 34.0799 49.467 35.2001 49.467 36.8449V40.4723H55.1126L54.3747 46.1713H49.467V63.0192C58.9801 60.2897 65.9415 51.5324 65.9415 41.1391Z" fill="#F3F3F3" />
								</svg>
							</a>
							<a class="follow__social-item" href="https://www.youtube.com/@metodica_med_spa" target="_blank">
								<svg width="84" height="84" viewBox="0 0 84 84" fill="none" xmlns="http://www.w3.org/2000/svg">
									<circle cx="42.2807" cy="41.9522" r="41.4561" fill="#7A7599" />
									<path d="M65.1966 30.7188C64.9491 28.6544 63.0036 26.6749 60.9681 26.4097C48.5581 24.8674 36.005 24.8674 23.5951 26.4097C21.5578 26.6743 19.6123 28.6544 19.3649 30.7188C18.4886 38.2848 18.4886 45.6208 19.3649 53.1851C19.6123 55.2495 21.5578 57.2309 23.5951 57.4943C36.005 59.0366 48.5581 59.0366 60.9681 57.4943C63.0036 57.2314 64.9491 55.2495 65.1966 53.1851C66.073 45.6215 66.073 38.2848 65.1966 30.7188ZM38.3516 49.8111V34.0952L50.1384 41.9535L38.3516 49.8111Z" fill="#F3F3F3" />
								</svg>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		{include 'file:chunks/main/contacts.tpl'}
	</main>
	{include 'file:chunks/main/footer.tpl'}
</body>
</html>