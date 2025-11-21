<!DOCTYPE html>
<html lang="en">
{include 'file:chunks/main/head.tpl'}
<body>
	{include 'file:chunks/main/header.tpl'}
	<main>
		<h1>{if $_modx->resource.longtitle}{$_modx->resource.longtitle}{else}{$_modx->resource.pagetitle}{/if}</h1>
		{$_modx->runSnippet('!mFilter2', [
        	'parents' => $_modx->resource.id,
        	'setMeta' => 0,
        	'limit' => 6,
        	'tplOuter' => '@FILE chunks/work/blog_tplOuter.tpl',
        	'tpl' => '@FILE chunks/work/blog_row.tpl',
        	'sort' => 'resource|publishedon:desc',
        	'ajaxMode' => 'button',
        	'processTVs' => 1,
        	'includeContent' => 0,
        	'includeTVs' => 'blog_img,blog_filter',
        	'filters' => 'tv|blog_filter',
			'filterOptions' => '{
				"more_tpl": "<div class=\"centered-box\"><button class=\"btn btn-default btn_more more-btn\">See more</button></div>"
			}',
            'tplFilter.outer.tv|blog_filter' => 'tpl.mFilter2.filter.outer_my',
            'tplFilter.row.tv|blog_filter' => 'tpl.mFilter2.filter.checkbox_my',
        ])}
	</main>
	{include 'file:chunks/main/footer.tpl'}
</body>
</html>