<!DOCTYPE html>
<html lang="en">
{include 'file:chunks/main/head.tpl'}
<body>
	{include 'file:chunks/main/header.tpl'}
	<main>
		<h1>{if $_modx->resource.longtitle}{$_modx->resource.longtitle}{else}{$_modx->resource.pagetitle}{/if}</h1>
		{$_modx->resource.content}
		{$_modx->runSnippet('!mFilter2', [
        	'parents' => $_modx->resource.id,
        	'setMeta' => 0,
        	'limit' => 3,
        	'tplOuter' => '@FILE chunks/work/review_tplOuter.tpl',
        	'tpl' => '@FILE chunks/work/review_row.tpl',
        	'sort' => 'resource|publishedon:desc',
        	'ajaxMode' => 'button',
        	'includeContent' => 1,
        	'includeTVs' => 'review_date,review_link,review_rating,filter_review',
        	'filters' => 'tv|filter_review',
			'filterOptions' => '{
				"more_tpl": "<div class=\"centered-box\"><button class=\"btn btn-default btn_more more-btn\">See more</button></div>"
			}',
            'tplFilter.outer.tv|filter_review' => 'tpl.mFilter2.filter.outer_my',
            'tplFilter.row.tv|filter_review' => 'tpl.mFilter2.filter.checkbox_my',
        ])}
		{include 'file:chunks/work/consultation-feedback.tpl'}
		{include 'file:chunks/main/contacts.tpl'}
	</main>
	{include 'file:chunks/main/footer.tpl'}
</body>
</html>