<label class="search-categories__item" data-category="{$id}">
	<input type="checkbox" name="categories[]" value="{$id}"{if $.get.filtercategory == $id} checked{/if}>
	<span class="search-categories__item-text">{$pagetitle}</span>
</label>