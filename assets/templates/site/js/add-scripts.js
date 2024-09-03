$(document).ready(function () {
	$('.blog-content .faq__item .faq__item-body.jsTogglerBody').eq(0).show();
	$('.faq-js .faq__box .faq__item-body.jsTogglerBody').eq(0).show();
});
$(document).on('af_complete', function(event, response) {
  var form = response.form;
    if (form.attr('id') == 'modal_form') {
    if (response.success){
		$.fancybox.close();
		$.fancybox.open('<div class="message"><p>Thank you for your request. Our manager will contact you shortly.</p></div>');
    }
  }
});