<a class="specialist-item" href="{$id | url}">
	<div class="specialist-item__head">
		<picture>
			<source srcset="{$_modx->runSnippet('!pThumb', ['input' => $_pls['doctor_img'], 'options' => '&w=335&h=335&f=webp&zc=T'])}" type="image/webp">
			<img src="{$_modx->runSnippet('!pThumb', ['input' => $_pls['doctor_img'], 'options' => '&w=335&h=335&zc=T'])}" alt="">
		</picture>
	</div>
	<div class="specialist-item__body">
		<div class="specialist-item__top">
			<h3 class="small-heading specialist-item__name">{$pagetitle}</h3>
			<div class="specialist-item__position">
				{if $_pls['doctor_specialization']}<p>{$_pls['doctor_specialization']}</p>{/if}
			</div>
		</div>
		{if $_pls['doctor_service']}
		{set $doctor_service = json_decode($id |resource: 'doctor_service', true)}
		<ul>
			{foreach $doctor_service as $row}
			<li>{$row.doctor_service_name}</li>
			{/foreach}
		</ul>
		{/if}
	</div>
</a>