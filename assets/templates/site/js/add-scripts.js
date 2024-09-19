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
$(document).on('af_complete', function(event, response) {
  var form = response.form;
    if (form.attr('id') == 'feedback_form') {
    if (response.success){
		$.fancybox.open('<div class="message"><p>Thank you for your request. Our manager will contact you shortly.</p></div>');
    }
  }
});

$(document).on('mse2_load', function (e, data) {
	$('.jsTwenty').twentytwenty();
});


$(document).ready(function () {
    $(document).on('click', '.jsMorereview', function(){
      let master_id = $(this).attr('data-master');  
      let start = 3;
      let star_more = $(this).attr('data-count');  

      //console.log(master_id);


      $.ajax({
        type: 'POST',
        url: '/ajax-more.html',
        dataType: 'json',
        cache: false,
        data: ({'starmore': star_more,'master_id': master_id}),
        success: function(data) {
          $('.reviews__content').css('opacity', 1);
          //console.log(data);
          //$('.jsMorereview').remove();
          //let more_html = '<a data-count="'+start+'" data-master="" class="btn jsMorereview" href="#">View more review</a>';
          //$('#centered-box').append(more_html);
          let star_more = parseInt($('.jsMorereview').attr('data-count')); 
          let sum = star_more + 3;
          $('.jsMorereview').attr('data-count',sum);
          $('.reviews__content').append(data.service);

          if (sum > data.allcount) {
            $('.jsMorereview').remove();
          }
        },
        error: function(jqXHR, textStatus, errorThrown) {
            alert(textStatus + ' ' + errorThrown);
        },
        beforeSend : function() {
          $('.reviews__content').css('opacity', .5);
        },
      });


      
      return false;

    })
});



