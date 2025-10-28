<div class="video-card swiper-slide">
	<a class="shorts__slider-item" href="{$_pls['tv.videoshorts_link']}" data-fancybox="" data-vertical="true">
		<div class="play-btn has-decor">
			<svg width="72" height="72" viewBox="0 0 72 73" fill="none" xmlns="http://www.w3.org/2000/svg">
				<circle cx="36" cy="36.7046" r="36" fill="#F9F9F9" fill-opacity="0.8" />
				<path d="M51.5 36.8386C52.1667 37.2235 52.1667 38.1857 51.5 38.5706L29 51.561C28.3333 51.9459 27.5 51.4648 27.5 50.695L27.5 24.7142C27.5 23.9444 28.3333 23.4633 29 23.8482L51.5 36.8386Z" fill="#EA6852" />
			</svg>
		</div>
		<div class="shorts__slider-img">
			{$_modx->runSnippet('!youtube', [
				'url' => $_pls['tv.videoshorts_link']
			])}
		</div>
		<div class="shorts__slider-name">{$pagetitle}</div>
	</a>
	{if $_pls['tv.video_text']}
	<div class="video-card__body video-card__body_read">
		<button data-id={$id} class="btn ajaxVideoShortsJS">Read more</button>
	</div>
	{/if}
</div>	