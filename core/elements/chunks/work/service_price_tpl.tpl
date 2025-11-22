{set $discount_add = 0}
{if $.cookie['getDiscount'] != 'Y'}
	{set $discount = 'discount_percent' | placeholder ?: 0}
	{set $discount_add = ($_pls['tv.service_price'] ?: 0) / 100 * $discount}
{/if}
<tr class="{$discount} {if $.cookie['getDiscount'] != 'Y'}no_discount{/if}">
	<td data-cell="{if $.cookie['getDiscount'] == 'Y'}{$_pls['tv.service_price'] | floatval + $discount_add}${/if}" {if $_pls['tv.service_price_old'] && ($_pls['tv.service_price_old'] | floatval > $_pls['tv.service_price'] | floatval)}data-sells="{$_pls['tv.service_price_old']}$"{/if}>{$pagetitle}</td>
	<td class="search-table__price">{if $_pls['tv.service_price_old'] && ($_pls['tv.service_price_old'] | floatval > $_pls['tv.service_price'] | floatval)}<span class="old_price">{$_pls['tv.service_price_old']}$</span>{/if} {if $.cookie['getDiscount'] == 'Y'}{$_pls['tv.service_price'] | floatval + $discount_add}${/if}</td>
	<td>
	    {if $.cookie['getDiscount'] == 'Y'}
	        <a class="btn" href="{'widget_link' | placeholder}" target="_blank">Book</a>
	    {else}
		    <button class="btn jsGetDiscountButton" href="#modal_discount" data-discount="{$pagetitle | notags | htmlent}" data-fancybox>Get a discount</button>
		{/if}
	</td>
</tr>