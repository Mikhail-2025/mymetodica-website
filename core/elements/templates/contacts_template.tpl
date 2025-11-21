<!DOCTYPE html>
<html lang="en">
{include 'file:chunks/main/head.tpl'}
<body>
	{include 'file:chunks/main/header.tpl'}
	<main>
		<h1>{if $_modx->resource.longtitle}{$_modx->resource.longtitle}{else}{$_modx->resource.pagetitle}{/if}</h1>
		{include 'file:chunks/main/contacts.tpl'}
		{include 'file:chunks/main/follow.tpl'}
		{include 'file:chunks/main/routes.tpl'}
		<div class="practice">
			<div class="container">
				<h2 class="main-heading no-mobile">Our Med Spa</h2>
				<div class="practice__inner">
					<div class="practice__img high-radius-img">
						<picture>
							<source srcset="{$_modx->runSnippet('!pThumb', ['input' => $_modx->resource.contact_img, 'options' => '&w=548&h=456&f=webp&zc=1'])}" type="image/webp">
        					<img src="{$_modx->runSnippet('!pThumb', ['input' => $_modx->resource.contact_img, 'options' => '&w=548&h=456&zc=1'])}" alt="">
						</picture>
					</div>
					<div class="practice__content light">
						<div class="main-heading practice__response-heading">Our Med Spa</div>
						{$_modx->resource.content}
						<div class="practice__btn">
							<a class="btn" href="{14 | url}">See more</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	{include 'file:chunks/main/footer.tpl'}
</body>
</html>