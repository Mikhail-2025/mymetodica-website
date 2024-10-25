{set $discount_add = 0}
{if $.cookie['getDiscount'] != 'Y'}
	{set $discount = 'discount_percent' | placeholder ?: 0}
	{set $discount_add = ($_pls['tv.service_price'] ?: 0) / 100 * $discount}
{/if}
<tr class="{$discount}">
	<td data-cell="{$_pls['tv.service_price'] | floatval + $discount_add}$">{$pagetitle}</td>
	<td class="search-table__price">{$_pls['tv.service_price'] | floatval + $discount_add}$</td>
	<td>
	    {if $.cookie['getDiscount'] == 'Y'}
	        <a class="btn" href="{'widget_link' | placeholder}" target="_blank">Sign up</a>
	    {else}
		    <button class="btn jsGetDiscountButton" href="#modal_discount" data-discount="{$pagetitle | notags | htmlent}" data-fancybox>Get a discount</button>
		{/if}
	</td>
</tr>