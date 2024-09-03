<div class="compare__item">
	<div class="compare__item-img">
		<div class="jsTwenty">
			<img src="{$_modx->runSnippet('!pThumb', ['input' => $_pls['tv.photo_before_img'], 'options' => '&w=440&h=400&zc=1'])}" alt="">
			<img src="{$_modx->runSnippet('!pThumb', ['input' => $_pls['tv.photo_after_img'], 'options' => '&w=440&h=400&zc=1'])}" alt="">
		</div>
	</div>
	<div class="compare__item-content">
		<div class="compare__item-head">
			<h3 class="small-heading">{$pagetitle}</h3>
			{if $_pls['tv.photo_icon']}
			<div class="compare__item-icon">
				<img src="{$_pls['tv.photo_icon']}" alt="">
			</div>
			{/if}
		</div>
		{if $_pls['tv.photo_params']}
		{set $photo_params = json_decode($id |resource: 'photo_params', true)}
		<div class="compare__item-body">
			<ul class="compare-list">
				{foreach $photo_params as $row}
				<li class="compare-list__item">{$row.photo_params_val}</li>
				{/foreach}
			</ul>
		</div>
		{/if}
	</div>
</div>