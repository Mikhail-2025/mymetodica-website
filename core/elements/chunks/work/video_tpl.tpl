<div class="video-card swiper-slide">
	<a class="video-card__head" href="{$_pls['tv.video_link']}" data-fancybox>
		<picture>
	        <source srcset="{$_modx->runSnippet('!pThumb', ['input' => $_pls['tv.video_img'], 'options' => '&w=453&h=257&f=webp&zc=1'])}" type="image/webp">
	        <img src="{$_modx->runSnippet('!pThumb', ['input' => $_pls['tv.video_img'], 'options' => '&w=453&h=257&zc=1'])}" alt="">
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
		<b>{$pagetitle}</b>
	</div>
</div>