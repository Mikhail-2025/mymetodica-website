<!DOCTYPE html>
<html lang="en">
{include 'file:chunks/main/head.tpl'}
<body>
	{include 'file:chunks/main/header.tpl'}
	<main>
		<div class="container">
			<h1>{if $_modx->resource.longtitle}{$_modx->resource.longtitle}{else}{$_modx->resource.pagetitle}{/if}</h1>
			<div class="search-result" id="pdopage">
				<div class="rows">
				{$_modx->runSnippet('!pdoPage', [
					'element' => 'mSearch2',
					'setMeta' => 0,
					'limit' => 12,
					'where' => ['template:NOT in' => [0,16,18,10,5,6,19]]
					'ajaxMode' => 'button',
					'tpl' => '@FILE chunks/work/tpl.mSearch2.row_my.tpl',
					'ajaxTplMore'  => '@INLINE <div class="centered-box"><button class="btn btn-default btn-more more-btn">See more</button></div>'
				])}
				</div>
				{'page.nav' | placeholder}
			</div>		
		</div>
	</main>
	{include 'file:chunks/main/footer.tpl'}
</body>
</html>