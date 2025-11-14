<div class="blog-main__inner">
	<div class="blog-main__content">
		<div class="blog-main__date">[[+publishedon:dateRU]]</div>
		<h2 class="main-heading text-left">{$pagetitle}</h2>
		{if $_pls['tv.blog_doctor_text']}
		<div class="blog-main__reviewer">
			<p>Aesthetician's Reviewed by</p>
			<div class="blog-main__reviewer-row">
				<span class="blog-main__reviewer-name">{$_pls['tv.blog_doctor_text']}</span>
				{if $_pls['tv.blog_doctor_link']}
				<a class="btn" href="{$_pls['tv.blog_doctor_link'] | url}">REED</a>
				{/if}
			</div>
		</div>
		{/if}
	</div>
	<div class="blog-main__img">
		<picture>
			<source srcset="{$_modx->runSnippet('!pThumb', ['input' => $_pls['tv.blog_detal_img'], 'options' => '&w=665&h=478&f=webp&zc=1'])}" type="image/webp">
			<img src="{$_modx->runSnippet('!pThumb', ['input' => $_pls['tv.blog_detal_img'], 'options' => '&w=665&h=478&zc=1'])}" alt="">
		</picture>
	</div>
</div>