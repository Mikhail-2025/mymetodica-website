<div class="contacts">
	<div class="contacts__map right-bottom-radius">
		{1 | resource: 'home_contacts_map'}
	</div>
	<div class="contacts__content">
		<h2 class="main-heading text-left">Location </h2>
		<div class="contacts__item">
			{1 | resource: 'home_contacts_adress'}
		</div>
		<div class="contacts__item">
			{set $phone = 1 | resource: 'home_contacts_phone'}
			<a class="contacts__tel" href="tel:{$phone | preg_replace : '/[^0-9+]/' : ''}">{1 | resource: 'home_contacts_phone'}</a>
		</div>
		<div class="contacts__item">
			{1 | resource: 'home_contacts_time'}
		</div>
		<div class="contacts__item">
			<a target="_blank" class="btn" href="https://n1239285.alteg.io/">Free Advice</a>
		</div>
	</div>
</div>