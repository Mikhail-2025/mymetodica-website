<label class="search-main__item swiper-slide">
	<input type="radio" name="group" value="{$id}">
	<span class="search-main__item-body">
		<picture>
			<source media="(max-width: 768px)" srcset="{$_modx->runSnippet('!pThumb', ['input' => $_pls['tv.photo_filtergroup_mobile_img'], 'options' => '&w=690&h=290&f=webp&zc=1'])}" type="image/webp">
			<source media="(max-width: 768px)" srcset="{$_modx->runSnippet('!pThumb', ['input' => $_pls['tv.photo_filtergroup_mobile_img'], 'options' => '&w=690&h=290&zc=1'])}">
			<source srcset="{$_modx->runSnippet('!pThumb', ['input' => $_pls['tv.photo_filtergroup_pc_img'], 'options' => '&w=276&h=188&f=webp&zc=1'])}" type="image/webp">
			<img src="{$_modx->runSnippet('!pThumb', ['input' => $_pls['tv.photo_filtergroup_pc_img'], 'options' => '&w=276&h=188&zc=1'])}" alt="">
		</picture>
		<span class="search-main__text">{$pagetitle}</span>
	</span>
</label>

