$(document).on('af_complete', function(event, response) {
  var form = response.form;
    if (form.attr('id') == 'modal_form') {
    if (response.success){
		$.fancybox.close();
		$.fancybox.open('<div class="message"><p>Thank you for your request. Our manager will contact you shortly.</p></div>');
    }
  }
});