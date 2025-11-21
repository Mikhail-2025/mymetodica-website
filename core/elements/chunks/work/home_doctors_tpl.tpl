<div class="specialist-card swiper-slide">
	<div class="specialist-card__head">
		<picture>
			<source srcset="{$_modx->runSnippet('!pThumb', ['input' => $_pls['tv.doctor_img'], 'options' => '&w=594&h=582&f=webp&zc=T&q=95'])} 2x, {$_modx->runSnippet('!pThumb', ['input' => $_pls['tv.doctor_img'], 'options' => '&w=297&h=291&f=webp&zc=T&q=95'])} 1x" type="image/webp">
			<source srcset="{$_modx->runSnippet('!pThumb', ['input' => $_pls['tv.doctor_img'], 'options' => '&w=594&h=582&zc=T&q=95'])} 2x, {$_modx->runSnippet('!pThumb', ['input' => $_pls['tv.doctor_img'], 'options' => '&w=297&h=291&zc=T&q=95'])} 1x" type="image/jpeg">
			<img src="{$_modx->runSnippet('!pThumb', ['input' => $_pls['tv.doctor_img'], 'options' => '&w=297&h=291&zc=T&q=95'])}" width="297" height="291" alt="">
		</picture>
	</div>
	<div class="specialist-card__body">
		<h3 class="small-heading specialist-card__name"><a href="{$id | url}">{$pagetitle}</a></h3>
		{if $_pls['tv.doctor_specialization']}<p>{$_pls['tv.doctor_specialization']}</p>{/if}
	</div>
</div>
