<div class="reviews bottom-right-radius">
	<div class="container">
		<h2 class="main-heading">Reviews</h2>
		<div class="reviews__head">		
			{$_modx->runSnippet('!countRating')}
			<span>[[!+total]] reviews</span>
		</div>
		<div class="reviews__content">
			{$_modx->runSnippet('!pdoResources', [
				'parents' => 2,
				'depth' => 0,
				'limit' => 3,
				'setTotal' => 1,
				'includeContent' => 1,
				'includeTVs' => 'review_date,review_link,review_rating',
				'tpl' => '@FILE chunks/work/home-reviews-inn.tpl',
				'sortby' => 'menuindex',
				'sortdir' => 'ASC'
			])}
			
		</div>
		<div class="centered-box">
			<a class="btn" href="{2 | url}">View more review</a>
		</div>
	</div>
</div>