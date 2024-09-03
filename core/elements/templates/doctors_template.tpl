<!DOCTYPE html>
<html lang="en">
{include 'file:chunks/main/head.tpl'}
<body>
	{include 'file:chunks/main/header.tpl'}
	<main>
		<div class="specialist-main">
			<div class="specialist-main__img">
				<picture>
					<source media="(max-width: 768px)" srcset="{$_modx->runSnippet('!pThumb', ['input' => $_modx->resource.doctors_mobile_img, 'options' => '&w=750&h=652&f=webp&zc=1'])}" type="image/webp">
					<source media="(max-width: 768px)" srcset="{$_modx->runSnippet('!pThumb', ['input' => $_modx->resource.doctors_mobile_img, 'options' => '&w=750&h=652&zc=1'])}">
					<source srcset="{$_modx->runSnippet('!pThumb', ['input' => $_modx->resource.doctors_pc_img, 'options' => '&w=1903&h=624&f=webp&zc=1'])}" type="image/webp">
					<img src="{$_modx->runSnippet('!pThumb', ['input' => $_modx->resource.doctors_pc_img, 'options' => '&w=1903&h=624&zc=1'])}" alt="">
				</picture>
			</div>
			<div class="specialist-main__content jsContentBlock">
				<div class="container">
					<div class="specialist-main__inner">
						<h1 class="text-left">{if $_modx->resource.longtitle}{$_modx->resource.longtitle}{else}{$_modx->resource.pagetitle}{/if}</h1>
						{$_modx->resource.content}
					</div>
					<div class="specialist-main__btn">
						<button class="btn jsCutBtn">Read more</button>
					</div>
				</div>
			</div>
		</div>
		{$_modx->runSnippet('!mFilter2', [
        	'parents' => $_modx->resource.id,
        	'setMeta' => 0,
        	'limit' => 8,
        	'tplOuter' => '@FILE chunks/work/doctor_tplOuter.tpl',
        	'tpl' => '@FILE chunks/work/doctor_row.tpl',
        	'sort' => 'resource|menuindex:asc',
        	'ajaxMode' => 'button',
        	'processTVs' => 1,
        	'includeContent' => 0,
        	'includeTVs' => 'doctor_img,doctor_specialization,doctor_service,filter_doctor',
        	'filters' => 'tv|filter_doctor',
			'filterOptions' => '{
				"more_tpl": "<div class=\"centered-box\"><button class=\"btn btn-default btn_more more-btn\">See more</button></div>"
			}',
            'tplFilter.outer.tv|filter_doctor' => 'tpl.mFilter2.filter.outer_my',
            'tplFilter.row.tv|filter_doctor' => 'tpl.mFilter2.filter.checkbox_my',
        ])}
		{include 'file:chunks/work/consultation-feedback.tpl'}
	</main>
	{include 'file:chunks/main/footer.tpl'}
</body>
</html>