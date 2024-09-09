<div style="display:none;" id="modal" class="modal">
	{set $form_mail = 1 | resource: 'form_mail'}
	{set $emailsender = $_modx->config.emailsender}
	{$_modx->runSnippet('!AjaxForm', [
		'snippet' => 'FormIt',
		'form' => 'modal_form',
		'preHooks' => 'chkbot',
		'hooks' => 'FormItSaveForm,email',
		'formName' =>'Book now',
		'formFields' => 'name,phone,email',
		'fieldNames' => 'name==Имя отправителя,phone==Телефон отправителя,email==Email'
		'emailTpl' => 'modal_report_tpl',
		'emailSubject' => 'Сообщение с сайта mymetodica.com',
		'emailFrom' => $emailsender,
		'emailTo' => $form_mail,
		'validate'=>'name:required,email:email:required,phone:required',
		'validationErrorMessage'=>'The form contains errors!',
		'successMessage' => 'Message sent successfully'
	])}
</div>
<footer class="footer">
	<div class="container">
		<div class="footer__top">
			<div class="footer__inner">
				<div class="footer__left">
					<a class="footer__logo" href="{$_modx->config['site_url']}">
						<img src="assets/templates/site/img/svg/footer-logo.svg" alt="">
					</a>
					<div class="footer__follow">
						<p>Follow us</p>
						<div class="follow__social">
							{set $soc_instagram = 1 | resource: 'soc_instagram'}
							{set $soc_facebook = 1 | resource: 'soc_facebook'}
							{set $soc_youtube = 1 | resource: 'soc_youtube'}
							{if $soc_instagram}
							<a class="follow__social-item" href="{$soc_instagram}" target="_blank">
								<svg width="51" height="51" viewBox="0 0 51 51" fill="none" xmlns="http://www.w3.org/2000/svg">
									<circle cx="25.5" cy="25.5" r="25.5" fill="#7A7599" />
									<path fill-rule="evenodd" clip-rule="evenodd" d="M18.5827 13.167C16.8809 13.167 15.2488 13.843 14.0454 15.0464C12.8421 16.2497 12.166 17.8819 12.166 19.5837V32.417C12.166 34.1188 12.8421 35.7509 14.0454 36.9543C15.2488 38.1576 16.8809 38.8337 18.5827 38.8337H31.416C33.1178 38.8337 34.7499 38.1576 35.9533 36.9543C37.1566 35.7509 37.8327 34.1188 37.8327 32.417V19.5837C37.8327 17.8819 37.1566 16.2497 35.9533 15.0464C34.7499 13.843 33.1178 13.167 31.416 13.167H18.5827ZM24.9993 21.3337C23.7617 21.3337 22.5747 21.8253 21.6995 22.7005C20.8243 23.5757 20.3327 24.7626 20.3327 26.0003C20.3327 27.238 20.8243 28.425 21.6995 29.3002C22.5747 30.1753 23.7617 30.667 24.9993 30.667C26.237 30.667 27.424 30.1753 28.2992 29.3002C29.1744 28.425 29.666 27.238 29.666 26.0003C29.666 24.7626 29.1744 23.5757 28.2992 22.7005C27.424 21.8253 26.237 21.3337 24.9993 21.3337ZM17.9993 26.0003C17.9993 24.1438 18.7368 22.3633 20.0496 21.0506C21.3624 19.7378 23.1428 19.0003 24.9993 19.0003C26.8559 19.0003 28.6363 19.7378 29.9491 21.0506C31.2619 22.3633 31.9993 24.1438 31.9993 26.0003C31.9993 27.8568 31.2619 29.6373 29.9491 30.9501C28.6363 32.2628 26.8559 33.0003 24.9993 33.0003C23.1428 33.0003 21.3624 32.2628 20.0496 30.9501C18.7368 29.6373 17.9993 27.8568 17.9993 26.0003ZM31.9993 16.667C31.3805 16.667 30.787 16.9128 30.3494 17.3504C29.9118 17.788 29.666 18.3815 29.666 19.0003C29.666 19.6192 29.9118 20.2127 30.3494 20.6502C30.787 21.0878 31.3805 21.3337 31.9993 21.3337C32.6182 21.3337 33.2117 21.0878 33.6493 20.6502C34.0869 20.2127 34.3327 19.6192 34.3327 19.0003C34.3327 18.3815 34.0869 17.788 33.6493 17.3504C33.2117 16.9128 32.6182 16.667 31.9993 16.667Z" fill="#F3F3F3" />
								</svg>
							</a>
							{/if}
							{if $soc_facebook}
							<a class="follow__social-item" href="{$soc_facebook}" target="_blank">
								<svg width="51" height="51" viewBox="0 0 51 51" fill="none" xmlns="http://www.w3.org/2000/svg">
									<circle cx="25.5" cy="25.5" r="25.5" fill="#7A7599" />
									<path d="M40 25.5C40 17.491 33.509 11 25.5 11C17.491 11 11 17.491 11 25.5C11 33.509 17.491 40 25.5 40C25.585 40 25.6699 40 25.7549 39.9943V28.7115H22.6396V25.0809H25.7549V22.4074C25.7549 19.3092 27.6467 17.6213 30.4107 17.6213C31.7361 17.6213 32.8746 17.7176 33.2031 17.7629V21.0027H31.3C29.799 21.0027 29.5045 21.7164 29.5045 22.7643V25.0752H33.1012L32.6311 28.7059H29.5045V39.4393C35.565 37.7004 40 32.1213 40 25.5Z" fill="#F3F3F3" />
								</svg>
							</a>
							{/if}
							{if $soc_youtube}
							<a class="follow__social-item" href="{$soc_youtube}" target="_blank">
								<svg width="51" height="51" viewBox="0 0 51 51" fill="none" xmlns="http://www.w3.org/2000/svg">
									<circle cx="25.5" cy="25.5" r="25.5" fill="#7A7599" />
									<path d="M39.5957 18.5906C39.4435 17.3208 38.2468 16.1032 36.9947 15.94C29.3613 14.9913 21.6398 14.9913 14.0063 15.94C12.7532 16.1028 11.5565 17.3208 11.4043 18.5906C10.8653 23.2445 10.8653 27.757 11.4043 32.4098C11.5565 33.6796 12.7532 34.8984 14.0063 35.0604C21.6398 36.0091 29.3613 36.0091 36.9947 35.0604C38.2468 34.8987 39.4435 33.6796 39.5957 32.4098C40.1348 27.7574 40.1348 23.2445 39.5957 18.5906ZM23.0832 30.3345V20.6675L30.3333 25.5011L23.0832 30.3345Z" fill="#F3F3F3" />
								</svg>
							</a>
							{/if}
						</div>
					</div>
				</div>
				<ul class="footer__menu text-transform">
					{$_modx->runSnippet('!pdoMenu', [
						'parents' => 0,
						'level' => 1,
						'tplOuter' => '@INLINE {$wrapper}',
						'tpl' => '@INLINE <li class="footer__menu-item"><a class="footer__menu-link" href="{$link}">{$menutitle}</a></li>',
					])}
				</ul>
				<div class="footer__textblock">
					<p>Adress:
						<br> 626 Sheepshead Bay RD, Brooklyn, NY, USA
					</p>
					<p>Subway Stations:
						<br> West 8th Street, NY Aquarium Station (Q Train)
						<br> Neptune Avenue Station (F Train)
					</p>
					<p>сall <a href="tel:+19177179885">+1 917 717 9885</a>
					</p>
				</div>
			</div>
		</div>
		<div class="footer__bottom">
			<div class="footer__inner">
				<span>{'' | date : 'Y'} © METODICA Med Spa</span>
				<span class="footer__link">
					<a href="#">Terms and Conditions</a>
					<a href="#">Accessibility</a>
					<a href="#">Privacy Policy</a>
				</span>
				<span>Сreated by — <a target="_blank" href="https://www.abcwww.ru/">«ABV Site»</a>
				</span>
			</div>
		</div>
	</div>
</footer>
<script src="assets/templates/site/js/jquery-3.6.1.js"></script>
<script src="assets/templates/site/js/fancybox.js"></script>
<script src="assets/templates/site/js/swiper.js"></script>
<script src="assets/templates/site/js/twenty-twenty.js"> </script>
<script src="assets/templates/site/js/main.js"></script>
<script src="assets/templates/site/js/add-scripts.js"></script>
