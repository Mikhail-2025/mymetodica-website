<div class="feedback">
	<div class="container">
		<div class="feedback__inner">
			<div class="feedback__img">
				<img src="assets/templates/site/img/svg/feedback.svg" alt="">
			</div>
			<div class="feedback__content">
				<h2 class="main-heading text-left">Get free consultation with our specialist</h2>
				{set $form_mail = 1 | resource: 'form_mail'}
				{set $emailsender = $_modx->config.emailsender}
				{$_modx->runSnippet('!AjaxForm', [
					'snippet' => 'FormIt',
					'form' => 'feedback_form',
					'preHooks' => 'chkbot',
					'hooks' => 'FormItSaveForm,email',
					'formName' =>'Get free consultation with our specialist',
					'formFields' => 'namefeeed,phonefeeed,emailfeeed,message',
					'fieldNames' => 'namefeeed==Имя отправителя,phonefeeed==Телефон отправителя,emailfeeed==Email,message==Комментарий'
					'emailTpl' => 'feedback_report_tpl',
					'emailSubject' => 'Сообщение с сайта mymetodica.com',
					'emailFrom' => $emailsender,
					'emailTo' => $form_mail,
					'validate'=>'namefeeed:required,emailfeeed:email:required,phonefeeed:required,politikmodal:required',
					'validationErrorMessage'=>'The form contains errors!',
					'successMessage' => 'Message sent successfully'
				])}
			</div>
		</div>
	</div>
</div>