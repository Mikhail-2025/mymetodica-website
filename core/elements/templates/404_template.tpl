<!DOCTYPE html>
<html lang="en">
{include 'file:chunks/main/head.tpl'}
<body>
	{include 'file:chunks/main/header.tpl'}
	<main>
		<div class="no-page">
			<div class="container">
				<div class="no-page__inner">
					<h1>{if $_modx->resource.longtitle}{$_modx->resource.longtitle}{else}{$_modx->resource.pagetitle}{/if}</h1>
					{$_modx->resource.content}
					<a class="btn" href="{1 | url}">Main page </a>
				</div>
			</div>
		</div>
	</main>
	{include 'file:chunks/main/footer.tpl'}
</body>
</html>