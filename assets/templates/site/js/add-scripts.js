$(document).ready(function () {
  $('.blog-content .faq__item .faq__item-body.jsTogglerBody').eq(0).show();
  $('.faq-js .faq__box .faq__item-body.jsTogglerBody').eq(0).show();
  
  // a.ivanov
/*  $('#smsCode').on('input, keyup', function() {
      console.log('input');
      if($(this).val()) {
          $(this).closest('.form__item').show();
      }
  });*/
  // a.ivanov end
  
});
$(document).on('af_complete', function(event, response) {
    var form = response.form;
    if (form.attr('id') == 'modal_form') {
        if (response.success){
        		$.fancybox.close();
        		$.fancybox.open('<div class="message"><p>Thank you for your request. Our manager will contact you shortly.</p></div>');
        }
    }

    // a.ivanov
    if (form.attr('id') == 'modal_form_discount') {
        if (response.success){
            $.fancybox.close();
            $.fancybox.open('<div class="message"><p>Thank you for your request. Our manager will contact you shortly.</p></div>');

            $.ajax({
                type: 'POST',
                url: '/ajax-discount.html',
                dataType: 'json',
                cache: false,
                data: {
                    action: 'getDiscount'
                },
                success: function(data) {
                    //console.log(data);
                    var group = $('#filter-form input[name=group]:checked').val();
                    var category = '';
                    $('#step-5-filter input[type=checkbox]:checked').each(function() {
                        if(category == '') {
                            category = $(this).val();
                        } else {
                            category = category + ',' + $(this).val();    
                        }
                        
                    });
                    
                    let url = '';
                    if(group !== 'undefined' || group !== '') {
                        url = form.attr('action') + '?filtergroup=' + group;
                    }
                    if(category !== 'undefined' || category !== '') {
                        url = url + '&filtercategory=' + category;
                    }
                    //console.log(url);
                    document.location.href = url;
                }
                ,error: function(jqXHR, textStatus, errorThrown) {
                    alert(textStatus + ' ' + errorThrown);
                },
                beforeSend : function() {
                  
                },
            });

        } else {
            //console.log(response.data.sms_code);
            
            $('.jsSmsCodeWrap').find('input[name=repeat_sms]').remove();
            
            if(response.data.sms_code !== undefined) {
                $('.jsSmsCodeWrap').addClass('show');
            } else {
                $('.jsSmsCodeWrap').removeClass('show');
            }
            setTimeout(function() {
                $('body .jsSmsRepeat').on('click', function(e) {
                    console.log('repeat');
                    e.preventDefault();
                    $('.jsSmsCodeWrap').append('<input type="hidden" name="repeat_sms" value="1">');
                    form.find('button[type="submit"]').trigger('click');
                });
            }, 200);
        }
    }
    // a.ivanov end

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



