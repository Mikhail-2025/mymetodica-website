<article class="articles__item swiper-slide">
	<a href="{$id | url}">
		<div class="articles__item-img">
			<picture>
				<source srcset="{$_modx->runSnippet('!pThumb', ['input' => $_pls['tv.blog_img'], 'options' => '&w=662&h=450&f=webp&zc=1'])}" type="image/webp">
				<img src="{$_modx->runSnippet('!pThumb', ['input' => $_pls['tv.blog_img'], 'options' => '&w=662&h=450&zc=1'])}" width="662" height="450" alt="">
			</picture>
		</div>
		<div class="articles__item-body">
			<h3 class="articles__item-name">{$pagetitle}</h3>
			{if $introtext}<p>{$introtext}</p>{/if}
		</div>
	</a>
</article>
