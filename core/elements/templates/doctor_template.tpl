<!DOCTYPE html>
<html lang="en">
{include 'file:chunks/main/head.tpl'}
<body>
	{include 'file:chunks/main/header.tpl'}
	<main>
		<div class="detail-main">
			<div class="container">
				<div class="detail-main__mobile main-heading">{if $_modx->resource.longtitle}{$_modx->resource.longtitle}{else}{$_modx->resource.pagetitle}{/if}</div>
				<div class="detail-main__inner">
					<div class="detail-main__img">
						<picture>
							<source srcset="{$_modx->runSnippet('!pThumb', ['input' => $_modx->resource.doctor_img, 'options' => '&w=609&f=webp&zc=1'])}" type="image/webp">
							<img src="{$_modx->runSnippet('!pThumb', ['input' => $_modx->resource.doctor_img, 'options' => '&w=609&zc=1'])}" alt="">
						</picture>
					</div>
					<div class="detail-main__content">
						<h1 class="text-left">{$_modx->resource.pagetitle}</h1>
						{if $_modx->resource.doctor_experience}<div class="detail-main__exp">{$_modx->resource.doctor_experience}</div>{/if}
						<div class="detail-main__box">
							{if $_modx->resource.doctor_specialization}
							<div class="detail-main__position">
								<p>{$_modx->resource.doctor_specialization}</p>
							</div>
							{/if}
							{set $doctor_service = json_decode($_modx->resource.id |resource: 'doctor_service', true)}
							{if $doctor_service}
							<div class="detail-main__specialisation">
								<p>Specialization</p>
								<ul>
									{foreach $doctor_service as $row}
									<li>{$row.doctor_service_name}</li>
									{/foreach}
								</ul>
							</div>
							{/if}
							<div class="detail-main__buttons">
								<button class="btn" href="#modal" data-fancybox>Book now</button>
								<a class="btn dark" href="#">Оставить отзыв </a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="detail-education">
			<div class="container">
				<div class="detail-education__inner">
					<h2 class="main-heading text-left detail-education__heading">Education </h2>
					<div class="detail-education__content">
						<b>Стипендия</b>
						<p>Медицинский центр Нью-Йоркского университета, 1983–1987 гг.</p>
						<b>Лицензия</b>
						<ul>
							<li>Сертификация Совета, Американский совет хирургииСертификация Совета,</li>
							<li>Американский совет пластической хирургии</li>
							<li>Медицинская лицензия штата Нью-Йорк</li>
						</ul>
					</div>
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
		<div class="reviews top-left-radius no-offset no-mb">
			<div class="container">
				<h2 class="main-heading">Reviews</h2>
				<div class="reviews__head">
					<div class="reviews__total">
						<svg width="26" height="23" viewBox="0 0 26 23" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M13 0L16.897 7.34252L25.3637 8.63729L19.3055 14.47L20.6412 22.6127L13 18.875L5.35879 22.6127L6.6945 14.47L0.636266 8.63729L9.10298 7.34252L13 0Z" stroke="#EA6852" />
						</svg>
						<svg width="26" height="23" viewBox="0 0 26 23" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M13 0L16.897 7.34252L25.3637 8.63729L19.3055 14.47L20.6412 22.6127L13 18.875L5.35879 22.6127L6.6945 14.47L0.636266 8.63729L9.10298 7.34252L13 0Z" stroke="#EA6852" />
						</svg>
						<svg width="26" height="23" viewBox="0 0 26 23" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M13 0L16.897 7.34252L25.3637 8.63729L19.3055 14.47L20.6412 22.6127L13 18.875L5.35879 22.6127L6.6945 14.47L0.636266 8.63729L9.10298 7.34252L13 0Z" stroke="#EA6852" />
						</svg>
						<svg width="26" height="23" viewBox="0 0 26 23" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M13 0L16.897 7.34252L25.3637 8.63729L19.3055 14.47L20.6412 22.6127L13 18.875L5.35879 22.6127L6.6945 14.47L0.636266 8.63729L9.10298 7.34252L13 0Z" stroke="#EA6852" />
						</svg>
						<svg width="26" height="23" viewBox="0 0 26 23" fill="none" xmlns="http://www.w3.org/2000/svg">
							<path d="M13 0L16.897 7.34252L25.3637 8.63729L19.3055 14.47L20.6412 22.6127L13 18.875L5.35879 22.6127L6.6945 14.47L0.636266 8.63729L9.10298 7.34252L13 0Z" stroke="#EA6852" />
						</svg>
						<div class="reviews__total-mask" style="width: 100%">
							<svg width="26" height="23" viewBox="0 0 26 23" fill="none" xmlns="http://www.w3.org/2000/svg">
								<path d="M13 0L16.897 7.34252L25.3637 8.63729L19.3055 14.47L20.6412 22.6127L13 18.875L5.35879 22.6127L6.6945 14.47L0.636266 8.63729L9.10298 7.34252L13 0Z" fill="#EA6852" />
							</svg>
							<svg width="26" height="23" viewBox="0 0 26 23" fill="none" xmlns="http://www.w3.org/2000/svg">
								<path d="M13 0L16.897 7.34252L25.3637 8.63729L19.3055 14.47L20.6412 22.6127L13 18.875L5.35879 22.6127L6.6945 14.47L0.636266 8.63729L9.10298 7.34252L13 0Z" fill="#EA6852" />
							</svg>
							<svg width="26" height="23" viewBox="0 0 26 23" fill="none" xmlns="http://www.w3.org/2000/svg">
								<path d="M13 0L16.897 7.34252L25.3637 8.63729L19.3055 14.47L20.6412 22.6127L13 18.875L5.35879 22.6127L6.6945 14.47L0.636266 8.63729L9.10298 7.34252L13 0Z" fill="#EA6852" />
							</svg>
							<svg width="26" height="23" viewBox="0 0 26 23" fill="none" xmlns="http://www.w3.org/2000/svg">
								<path d="M13 0L16.897 7.34252L25.3637 8.63729L19.3055 14.47L20.6412 22.6127L13 18.875L5.35879 22.6127L6.6945 14.47L0.636266 8.63729L9.10298 7.34252L13 0Z" fill="#EA6852" />
							</svg>
							<svg width="26" height="23" viewBox="0 0 26 23" fill="none" xmlns="http://www.w3.org/2000/svg">
								<path d="M13 0L16.897 7.34252L25.3637 8.63729L19.3055 14.47L20.6412 22.6127L13 18.875L5.35879 22.6127L6.6945 14.47L0.636266 8.63729L9.10298 7.34252L13 0Z" fill="#EA6852" />
							</svg>
						</div>
					</div>
					<span>9 reviews</span>
				</div>
				<div class="reviews__content">
					<div class="reviews__item">
						<div class="reviews__item-head">
							<div class="reviews__item-author">
								<p>Kim.W</p>
								<div class="reviews__item-rating">
									<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" stroke="#EA6852" />
									</svg>
									<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" stroke="#EA6852" />
									</svg>
									<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" stroke="#EA6852" />
									</svg>
									<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" stroke="#EA6852" />
									</svg>
									<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" stroke="#EA6852" />
									</svg>
									<div class="reviews__total-mask" style="width: 100%">
										<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
											<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" fill="#EA6852" />
										</svg>
										<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
											<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" fill="#EA6852" />
										</svg>
										<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
											<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" fill="#EA6852" />
										</svg>
										<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
											<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" fill="#EA6852" />
										</svg>
										<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
											<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" fill="#EA6852" />
										</svg>
									</div>
								</div>
							</div>
							<div class="reviews__item-date">02 may 2024</div>
						</div>
						<div class="reviews__item-descr">
							<p>I highly recommend Dr. Bae. She is the consummate professional. I had full correction of my cheek area which included reducing my nasolabial folds, the sagginess under my eyes and lifting the heaviness in my cheeks. Like an artist she placed the filler in various areas with a beautiful natural outcome. I am 100% satisfied!!</p>
						</div>
						<div class="end-box">
							<a class="btn dark" href="#">View review </a>
						</div>
					</div>
					<div class="reviews__item">
						<div class="reviews__item-head">
							<div class="reviews__item-author">
								<p>Kim.W</p>
								<div class="reviews__item-rating">
									<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" stroke="#EA6852" />
									</svg>
									<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" stroke="#EA6852" />
									</svg>
									<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" stroke="#EA6852" />
									</svg>
									<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" stroke="#EA6852" />
									</svg>
									<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" stroke="#EA6852" />
									</svg>
									<div class="reviews__total-mask" style="width: 100%">
										<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
											<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" fill="#EA6852" />
										</svg>
										<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
											<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" fill="#EA6852" />
										</svg>
										<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
											<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" fill="#EA6852" />
										</svg>
										<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
											<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" fill="#EA6852" />
										</svg>
										<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
											<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" fill="#EA6852" />
										</svg>
									</div>
								</div>
							</div>
							<div class="reviews__item-date">02 may 2024</div>
						</div>
						<div class="reviews__item-descr">
							<p>I highly recommend Dr. Bae. She is the consummate professional. I had full correction of my cheek area which included reducing my nasolabial folds, the sagginess under my eyes and lifting the heaviness in my cheeks. Like an artist she placed the filler in various areas with a beautiful natural outcome. I am 100% satisfied!!</p>
						</div>
						<div class="end-box">
							<a class="btn dark" href="#">View review </a>
						</div>
					</div>
					<div class="reviews__item">
						<div class="reviews__item-head">
							<div class="reviews__item-author">
								<p>Kim.W</p>
								<div class="reviews__item-rating">
									<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" stroke="#EA6852" />
									</svg>
									<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" stroke="#EA6852" />
									</svg>
									<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" stroke="#EA6852" />
									</svg>
									<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" stroke="#EA6852" />
									</svg>
									<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" stroke="#EA6852" />
									</svg>
									<div class="reviews__total-mask" style="width: 100%">
										<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
											<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" fill="#EA6852" />
										</svg>
										<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
											<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" fill="#EA6852" />
										</svg>
										<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
											<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" fill="#EA6852" />
										</svg>
										<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
											<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" fill="#EA6852" />
										</svg>
										<svg width="26" height="24" viewBox="0 0 26 24" fill="none" xmlns="http://www.w3.org/2000/svg">
											<path d="M13 0.42041L16.897 7.76293L25.3637 9.0577L19.3055 14.8904L20.6412 23.0331L13 19.2954L5.35879 23.0331L6.6945 14.8904L0.636266 9.0577L9.10298 7.76293L13 0.42041Z" fill="#EA6852" />
										</svg>
									</div>
								</div>
							</div>
							<div class="reviews__item-date">02 may 2024</div>
						</div>
						<div class="reviews__item-descr">
							<p>I highly recommend Dr. Bae. She is the consummate professional. I had full correction of my cheek area which included reducing my nasolabial folds, the sagginess under my eyes and lifting the heaviness in my cheeks. Like an artist she placed the filler in various areas with a beautiful natural outcome. I am 100% satisfied!!</p>
						</div>
						<div class="end-box">
							<a class="btn dark" href="#">View review </a>
						</div>
					</div>
				</div>
				<div class="centered-box">
					<a class="btn" href="#">View more review</a>
				</div>
			</div>
		</div>
	</main>
	{include 'file:chunks/main/footer.tpl'}
</body>
</html>