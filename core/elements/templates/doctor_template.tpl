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
								<a target="_blank" class="btn" href="https://n317373.alteg.io">Book now</a>
								<a target="_blank" class="btn dark" href="https://www.google.com/maps/place/Metodica+Med+Spa/@40.57875,-73.975369,17z/data=!4m18!1m9!3m8!1s0x89c2458a53e5dbcd:0x5ce5a1bd58881cd!2s626+Sheepshead+Bay+Rd,+Brooklyn,+NY+11224,+USA!3b1!8m2!3d40.5788673!4d-73.975389!10e3!16s%2Fg%2F11y2yj6bt3!3m7!1s0x89c244490dcef487:0x34c7c85fed3a3124!8m2!3d40.5787502!4d-73.9753691!9m1!1b1!16s%2Fg%2F11rcszzwc7!5m1!1e1?hl=en&entry=ttu&g_ep=EgoyMDI0MDkwOS4wIKXMDSoASAFQAw%3D%3D">Leave feedback</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		{if $_modx->resource.doctor_education}
		<div class="detail-education">
			<div class="container">
				<div class="detail-education__inner">
					<h2 class="main-heading text-left detail-education__heading">Education</h2>
					<div class="detail-education__content">
						{$_modx->resource.doctor_education}
					</div>
				</div>
			</div>
		</div>
		{/if}
		{if $_modx->resource.doctor_video_ids}
		<div class="videos">
			<div class="container">
				<h2 class="main-heading">Videos</h2>
			</div>
			<div class="slider-container">
				<div class="videos__slider swiper">
					<div class="swiper-wrapper">
						{$_modx->runSnippet('!pdoResources', [
							'parents' => 15,
							'resources' => $_modx->resource.doctor_video_ids,
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
		{if $_modx->resource.doctor_videoshorts_ids}
		<div class="shorts">
			<div class="slider-container">
				<div class="shorts__slider swiper">
					<div class="swiper-wrapper">
						{$_modx->runSnippet('!pdoResources', [
							'parents' => 16,
							'resources' => $_modx->resource.doctor_videoshorts_ids,
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