<div class="header__submenu-item">
	<div class="header__submenu-name">
		<a href="{if $menu_treatments == '1'}{$link}{else}{/if}" {if $menu_treatments != '1'}onclick="return false;"{/if}>{$menutitle}</a>
	</div>
	<div class="header__menu-mobile jsTogglerHead">
		<span>{$menutitle}</span>
		<div class="header__menu-icon">
			<span></span>
			<span></span>
		</div>
	</div>
	{$wrapper}
</div>