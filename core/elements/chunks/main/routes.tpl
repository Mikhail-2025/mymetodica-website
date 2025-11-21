{if $rows = $_modx->resource.contacts_routes}
    <div class="find">
    	<div class="container">
    		<h2 class="main-heading">How to find us</h2>
    		<div class="find__head">
    		    {foreach $rows | fromJSON as $key => $row}
    			    <a class="find__head-item jsAnchorLink" href="#find-{$key + 1}">{$row.title}</a>
    			{/foreach}
    		</div>
    		<div class="find__body">
    		    {foreach $rows | fromJSON as $key => $row}
        			<div class="find__item jsFindItem" id="find-{$key + 1}">
        				<div class="find__item-head">
        					<span>{$row.first}</span>
        					<div class="find__item-group">
        						<svg xmlns="http://www.w3.org/2000/svg" width="105" height="33" viewBox="0 0 105 33" fill="none">
        							<path d="M85.773 0.425781C89.8211 9.02811 93.389 12.4659 102 16.2036C93.2886 20.0938 89.6914 23.5991 85.773 32.4307M0 16.4282H100" stroke="#EA6852" stroke-width="2" />
        						</svg>
        						<span>{$row.last}</span>
        					</div>
        				</div>
        				<div class="find__item-body">
        					<div class="find__item-box">
        						<a class="find__item-preview" href="{$row.video}" data-fancybox data-vertical="true">
        						    <picture>
            							<source srcset="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.video_image~'', 'options' => '&w=638&h=1132&q=90&zc=1&f=webp'])}" type="image/webp">
            							<img src="{$_modx->runSnippet('!pThumb', ['input' => 'assets/templates/upload/images/'~$row.video_image~'', 'options' => '&w=638&h=1132&q=90&zc=1&f=jpg'])}" alt="" {if $idx == 0}fetchpriority="high" loading="eager"{else}loading="lazy"{/if}>
            						</picture>
        							<div class="play-btn has-decor">
        								<svg width="72" height="72" viewBox="0 0 72 73" fill="none" xmlns="http://www.w3.org/2000/svg">
        									<circle cx="36" cy="36.7046" r="36" fill="#F9F9F9" fill-opacity="0.8"></circle>
        									<path d="M51.5 36.8386C52.1667 37.2235 52.1667 38.1857 51.5 38.5706L29 51.561C28.3333 51.9459 27.5 51.4648 27.5 50.695L27.5 24.7142C27.5 23.9444 28.3333 23.4633 29 23.8482L51.5 36.8386Z" fill="#EA6852"></path>
        								</svg>
        							</div>
        						</a>
        						<div class="find__item-mobile">
        							<p>{$row.video_title_first}</p>
        							<img src="assets/templates/upload/images/{$row.video_image_mobile}" alt="">
        							<p>{$row.video_title_last}</p>
        						</div>
        					</div>
        					{if $row.list}
            					<div class="find__item-content">
            						<div class="find__item-wrapper">
            						    {foreach $row.list | fromJSON as $item}
                							<div class="find__item-textbox">
                								{$item.title}
                							</div>
            							{/foreach}
            						</div>
            						<button class="find__item-more jsFindMore" type="button">
            							<span class="jsFindText">Show more </span>
            							<svg xmlns="http://www.w3.org/2000/svg" width="15" height="8" viewBox="0 0 15 8" fill="none">
            								<line y1="-0.75" x2="10.0315" y2="-0.75" transform="matrix(0.725705 0.688006 -0.725705 0.688006 0 1.03198)" stroke="#7A7599" stroke-width="1.5" />
            								<line y1="-0.75" x2="10.0315" y2="-0.75" transform="matrix(-0.725705 0.688006 0.725705 0.688006 15.0005 1.03198)" stroke="#7A7599" stroke-width="1.5" />
            							</svg>
            						</button>
            					</div>
        					{/if}
        				</div>
        			</div>
    			{/foreach}
    		</div>
    	</div>
    </div>
{/if}