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
							<source srcset="{$_modx->runSnippet('!pThumb', ['input' => $_modx->resource.about_start_service, 'options' => '&w=607&h=309&zc=1&f=webp'])}" type="image/webp">
							<img src="{$_modx->runSnippet('!pThumb', ['input' => $_modx->resource.about_start_service, 'options' => '&w=607&h=309&zc=1'])}" alt="">
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
								<source srcset="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.about_service_img_pc~'', 'options' => '&w=640&h=580&zc=1&f=webp'])}" type="image/webp">
								<img src="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.about_service_img_pc~'', 'options' => '&w=640&h=580&zc=1'])}" alt="">
							</picture>
						</div>
						<h3 class="small-heading services-card__name">{$row.about_service_name}</h3>
					</a>
					{/foreach}
				</div>
			</div>
		</div>
		{/if}
		
		{if $_modx->resource.show_ai_button == '1'}
		    <div class="ai_pre_wrap">
		{/if}
		
		{$_modx->resource.id | resource: 'about_advantages'}
		
		{if $_modx->resource.show_ai_button == '1'}
		    </div>
		{/if}
		
		{if $_modx->resource.show_ai_button == '1'}
    		<div class="ai_wrap container">
    		    <div class="blog-header__inner ai_button_wrap">
    		        <div class="ai_button_wrap--inner first"></div>
    		        <div class="ai_button_wrap--inner last">
    		            {*<a href="https://chatgpt.com/?prompt=Analyze+this+article+using+MECE+framework+{'id' | resource | url : ['scheme' => 'full'] | escape} {'pagetitle' | resource}+Create+3-5+non-overlapping+categories+that+cover+all+content.+List+key+points+under+each" class="btn ai_btn" target="_blank">*}
					                {set $string = '!urlencode' | snippet : ['input' => 'Analyze+this+article+using+MECE+framework+'~ $_modx->resource.id | url : ['scheme' => 'full'] | escape ~ ' +' ~ $_modx->resource.pagetitle ~ '+Create+3-5+non-overlapping+categories+that+cover+all+content.+List+key+points+under+each']}
					                <a href="https://chat.openai.com/?q={$string}" class="btn ai_btn" target="_blank">
    		                <span>Discuss with GPT</span>
    		                <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M12.6213 0.00442505C10.2219 0.227081 8.15941 1.45169 6.87035 3.41458C6.63304 3.78079 6.24632 4.54837 6.1057 4.93802L6.00609 5.21341L5.70433 5.28958C3.56273 5.82864 1.79906 7.25247 0.800034 9.24759C0.225815 10.3931 -0.0319972 11.5503 0.00315902 12.8335C0.0236668 13.5015 0.0676121 13.856 0.217026 14.4595C0.489487 15.564 0.967026 16.5132 1.7141 17.4419L1.93382 17.7115L1.84593 18.0279C1.64378 18.7339 1.56761 19.3052 1.56761 20.0699C1.56761 20.6704 1.59984 21.022 1.70824 21.5493C2.53148 25.5689 6.38988 28.2202 10.4094 27.5288L10.7024 27.479L11.0393 27.8042C12.0119 28.7447 13.1018 29.3775 14.3176 29.7115C16.9631 30.438 19.7903 29.6968 21.7121 27.7749C22.3127 27.1743 22.7698 26.5386 23.1418 25.7827C23.2678 25.5249 23.4172 25.188 23.4729 25.0357C23.5666 24.7749 23.5784 24.7574 23.6692 24.7339C24.3987 24.5493 25.0637 24.3033 25.5881 24.0249C27.5422 22.979 28.9455 21.1011 29.4231 18.898C29.593 18.1099 29.6282 17.0347 29.511 16.2466C29.4465 15.8189 29.2678 15.1128 29.1301 14.7349C28.8342 13.9351 28.3332 13.0738 27.8118 12.4673C27.7004 12.3384 27.6535 12.2593 27.6623 12.2183C27.6682 12.1861 27.7151 12.0074 27.7649 11.8228C28.4709 9.19193 27.6741 6.3765 25.6848 4.45462C25.0989 3.88919 24.4778 3.45267 23.7688 3.10696C22.3362 2.40677 20.7366 2.17825 19.1633 2.44193L18.8616 2.49466L18.6067 2.23392C18.0149 1.63626 17.3059 1.12357 16.5647 0.763214C15.4983 0.24173 14.5754 0.0220032 13.383 0.00442505C13.0373 -0.00143433 12.6946 -0.00143433 12.6213 0.00442505ZM14.1916 2.0347C15.0705 2.19876 15.8674 2.54153 16.5618 3.05423C16.7493 3.19485 16.8108 3.25052 16.7785 3.2681C16.7551 3.28275 15.3547 4.09134 13.6614 5.06985C11.5901 6.26517 10.5442 6.88333 10.4621 6.96536C10.3948 7.02982 10.3039 7.16458 10.2571 7.26419L10.175 7.4429L10.1662 11.7437C10.1604 15.2212 10.1516 16.0445 10.1223 16.0327C10.0286 15.9976 7.62328 14.5972 7.60277 14.5679C7.59105 14.5474 7.58519 12.8511 7.59105 10.7974C7.60277 6.71634 7.59691 6.8511 7.77562 6.16849C8.1975 4.55423 9.29613 3.21829 10.7903 2.50345C11.3176 2.2515 11.9914 2.05521 12.592 1.98196C12.9524 1.93509 13.8196 1.96439 14.1916 2.0347ZM20.927 4.32278C23.1565 4.53372 25.0461 6.02493 25.7493 8.13138C25.9338 8.68216 26.01 9.12454 26.0305 9.71341C26.0452 10.1499 26.0071 10.8091 25.966 10.8501C25.9543 10.8618 26.0129 10.8941 22.4358 8.82864C21.0266 8.01419 19.8137 7.31693 19.7405 7.28177C19.5735 7.19388 19.2278 7.17044 19.0373 7.23196C18.9641 7.2554 17.2502 8.22806 15.2287 9.397L11.552 11.521L11.5432 10.0562C11.5373 8.90775 11.5461 8.57962 11.5725 8.55325C11.593 8.53275 12.7121 7.87943 14.0569 7.10306C17.7366 4.97903 17.8303 4.9263 18.1174 4.79739C19.0139 4.39603 19.9719 4.23489 20.927 4.32278ZM5.65453 11.0669L5.66332 14.7671L5.75121 14.9253C5.79808 15.0103 5.89183 15.1304 5.95921 15.189C6.0266 15.2476 7.72289 16.2437 9.73265 17.4009C11.7424 18.5611 13.3801 19.5191 13.3772 19.5337C13.3655 19.5689 10.8928 20.9927 10.843 20.9927C10.8225 20.9927 10.4768 20.8052 10.0784 20.5738C9.67992 20.3423 8.66918 19.7564 7.83128 19.273C6.99339 18.7896 5.92113 18.1685 5.44945 17.896C4.97484 17.6236 4.47386 17.3189 4.33617 17.2193C3.00609 16.2788 2.15941 14.8169 1.98656 13.1704C1.81371 11.5064 2.4641 9.7515 3.68578 8.59134C4.11351 8.18411 4.55296 7.87064 5.04515 7.62454C5.28539 7.50443 5.58714 7.37259 5.62523 7.36966C5.63695 7.36966 5.6516 9.03372 5.65453 11.0669ZM21.8293 10.7417C23.508 11.7115 24.9553 12.5523 25.0432 12.6079C26.6311 13.6187 27.6213 15.4439 27.6213 17.357C27.6213 19.2818 26.5608 21.1509 24.9084 22.1441C24.718 22.2583 24.1086 22.5572 23.9973 22.5894L23.9299 22.607L23.9241 18.9068L23.9153 15.2066L23.8303 15.0572C23.6721 14.7671 23.8039 14.8521 20.7629 13.1001C17.6633 11.3101 16.1955 10.4576 16.2043 10.437C16.216 10.4019 18.6653 8.98685 18.7239 8.98392C18.7532 8.98099 20.1506 9.77493 21.8293 10.7417ZM16.4299 12.1831L18.0266 13.106V14.9868V16.8677L16.4065 17.8023L14.7893 18.7368L13.9455 18.2505C13.4827 17.9839 12.841 17.6118 12.5188 17.4243C12.1965 17.2398 11.845 17.0347 11.7366 16.9732L11.5373 16.8589V14.9868V13.1148L11.7366 13.0005C11.845 12.9361 12.3284 12.6577 12.8118 12.3794C13.2952 12.1011 13.9338 11.729 14.2327 11.5562C14.5315 11.3804 14.7893 11.2427 14.8039 11.2486C14.8215 11.2544 15.551 11.6734 16.4299 12.1831ZM20.7131 14.6558L21.97 15.3824L21.9582 19.2495C21.9494 23.5474 21.9641 23.2281 21.7473 23.9781C21.384 25.2437 20.5315 26.3892 19.4035 27.1216C17.7717 28.1851 15.6418 28.314 13.8957 27.4527C13.5735 27.2945 13.0491 26.9634 12.8616 26.8023L12.7649 26.7202L13.1838 26.4829C15.844 24.9654 19.0139 23.1109 19.1164 23.0083C19.1838 22.9439 19.2746 22.8091 19.3215 22.7095L19.4035 22.5308L19.4123 18.23C19.4153 15.8658 19.427 13.9322 19.4387 13.9322C19.4504 13.9322 20.0217 14.2574 20.7131 14.6558ZM18.0061 21.4234C17.9739 21.4527 14.9651 23.1958 12.3196 24.7193C11.3996 25.2466 10.8547 25.4634 10.1077 25.5894C9.17601 25.7476 8.28246 25.6802 7.39183 25.3843C5.0891 24.6197 3.53929 22.4839 3.53929 20.0757C3.53929 19.7124 3.58324 19.1529 3.61546 19.1206C3.62132 19.1148 3.85277 19.2408 4.13109 19.4019C4.40941 19.563 5.79808 20.3658 7.21605 21.1831C8.63402 22.0034 9.86156 22.6978 9.94066 22.73C10.0549 22.774 10.1369 22.7827 10.3069 22.774C10.5705 22.7564 10.5676 22.7593 11.6106 22.1558C13.0813 21.3062 17.4729 18.772 17.7483 18.6109L18.0266 18.4497L18.0354 19.9175C18.0412 21.0659 18.0325 21.3941 18.0061 21.4234Z" fill="white"/>
                            </svg>
    		            </a>
    		        </div>
    		    </div>
		    </div>
		{/if}
		
		<div class="about_advantages_text">
			<div class="container">
				<div class="about-main__inner">
					<div class="about-main__text">
						{$_modx->resource.about_advantages_text}
					</div>
				</div>
			</div>
		</div>
		<div class="follow pink">
			<div class="container">
				<div class="follow__inner">
					<div class="follow__img">
						<img src="assets/templates/site/img/svg/follow-white.svg" alt="">
					</div>
					<div class="follow__content">
						<h2 class="main-heading text-left">We are waiting for you in our Med Spa</h2>
						<a href="https://n1239285.alteg.io/" target="_blank" class="btn">Book now</a>
					</div>
				</div>
			</div>
		</div>
		{set $about_info = json_decode($_modx->resource.id |resource: 'about_info', true)}
		{if $about_info}
		<div class="about-info bottom-right-radius">
			<div class="container">
				{foreach $about_info as $row}
				<div class="about-info__item">
					<h2 class="main-heading">{$row.about_info_title}</h2>
					<div class="about-info__inner">
						{if $row.about_info_img}
						<div class="about-info__img high-radius-img">
							<picture>
								<source srcset="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.about_info_img~'', 'options' => '&f=webp'])}" type="image/webp">
								<img src="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.about_info_img~'', 'options' => '&f=png'])}" alt="">
							</picture>
						</div>
						{/if}
						<div class="about-info__text">
							{$row.about_info_desc}
						</div>
					</div>
				</div>
				{/foreach}
			</div>
		</div>
		{/if}
		{set $about_gallery = json_decode($_modx->resource.id |resource: 'about_gallery', true)}
		{if $about_gallery}
		<div class="clinic">
			<div class="container">
				<h2 class="main-heading">Our Med Spa</h2>
			</div>
			<div class="slider-container">
				<div class="clinic__slider swiper">
					<div class="swiper-wrapper">
						{foreach $about_gallery as $row}
						<a class="clinic__slider-item swiper-slide" href="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.about_gallery_img~'', 'options' => '&w=800'])}" data-fancybox="clinic">
							<picture>
								<source srcset="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.about_gallery_img~'', 'options' => '&w=335&h=335&zc=1&f=webp'])}" type="image/webp">
								<img src="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.about_gallery_img~'', 'options' => '&w=335&h=335&zc=1'])}" alt="">
							</picture>
						</a>
						{/foreach}
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
		{if $_modx->resource.about_video_ids}
		<div class="videos">
			<div class="container">
				<h2 class="main-heading">Videos</h2>
			</div>
			<div class="slider-container">
				<div class="videos__slider swiper">
					<div class="swiper-wrapper">
						{$_modx->runSnippet('!pdoResources', [
							'parents' => 15,
							'resources' => $_modx->resource.about_video_ids,
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
		{if $_modx->resource.about_videoshorts_ids}
		<div class="shorts">
			<div class="slider-container">
				<div class="shorts__slider swiper">
					<div class="swiper-wrapper">
						{$_modx->runSnippet('!pdoResources', [
							'parents' => 16,
							'resources' => $_modx->resource.about_videoshorts_ids,
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
		{include 'file:chunks/main/follow.tpl'}
		{include 'file:chunks/main/contacts.tpl'}
	</main>
	{include 'file:chunks/main/footer.tpl'}
</body>
</html>