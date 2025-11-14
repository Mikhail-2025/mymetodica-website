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
        	'limit' => 9,
        	'tplOuter' => '@FILE chunks/work/photo_tplOuter.tpl',
        	'tpl' => '@FILE chunks/work/photo_row.tpl',
        	'sort' => 'resource|menuindex:asc',
        	'ajaxMode' => 'button',
        	'processTVs' => 1,
        	'includeContent' => 0,
        	'includeTVs' => 'photo_before_img,photo_after_img,photo_params,photo_icon,photo_filtergroup,photo_filter',
        	'filters' => 'tv|photo_filtergroup,tv|photo_filter',
			'filterOptions' => '{
				"more_tpl": "<div class=\"centered-box\"><button class=\"btn btn-default btn_more more-btn\">See more</button></div>"
			}',

			'tplFilter.outer.tv|photo_filtergroup' => 'tpl.mFilter2.filter.outer_my_group_photo',
            'tplFilter.row.tv|photo_filtergroup' => 'tpl.mFilter2.filter.radio_my',

            'tplFilter.outer.tv|photo_filter' => 'tpl.mFilter2.filter.outer_my_param_photo',
            'tplFilter.row.tv|photo_filter' => 'tpl.mFilter2.filter.checkbox_my',
        ])}
		{include 'file:chunks/work/consultation-feedback.tpl'}
	</main>
	{include 'file:chunks/main/footer.tpl'}
</body>
</html>