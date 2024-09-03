<div class="specialist-card swiper-slide">
	<div class="specialist-card__head">
		<picture>
			<source srcset="{$_modx->runSnippet('!pThumb', ['input' => $_pls['tv.doctor_img'], 'options' => '&w=297&h=291&f=webp&zc=1'])}" type="image/webp">
			<img src="{$_modx->runSnippet('!pThumb', ['input' => $_pls['tv.doctor_img'], 'options' => '&w=297&h=291&zc=1'])}" alt="">
		</picture>
	</div>
	<div class="specialist-card__body">
		<h3 class="small-heading specialist-card__name">{$pagetitle}</h3>
		{if $_pls['tv.doctor_specialization']}<p>{$_pls['tv.doctor_specialization']}</p>{/if}
	</div>
</div>