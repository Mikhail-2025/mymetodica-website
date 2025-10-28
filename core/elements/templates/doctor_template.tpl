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
							<source srcset="{$_modx->runSnippet('!pThumb', ['input' => $_modx->resource.doctor_img, 'options' => '&w=609&h=464&f=webp&zc=T'])}" type="image/webp">
							<img src="{$_modx->runSnippet('!pThumb', ['input' => $_modx->resource.doctor_img, 'options' => '&w=609&h=464&zc=T'])}" alt="">
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
								<a href="#" class="ms_booking btn">Book now</a>
								<!--<a target="_blank" class="btn" href="https://n317373.alteg.io">Book now</a>!-->
								<a target="_blank" class="btn dark" href="https://g.page/r/CSQxOu1fyMc0EBE/review">Leave feedback</a>
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
				<a target="_blank" class="btn" href="{1 | resource : 'soc_youtube'}">See more</a>
			</div>
		</div>
		{/if}
		{$_modx->runSnippet('!doctorReviewsApi')}
	</main>
	{include 'file:chunks/main/footer.tpl'}
	<script type="text/javascript" src="//w317373.alteg.io/widgetJS" charset="UTF-8"></script>
</body>
</html>