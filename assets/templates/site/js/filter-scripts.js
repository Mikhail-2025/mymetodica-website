$(document).ready(function() {
	let form = $('#filter-form');
	
	// a.ivanov
	if(form.hasClass('jsFormNoAjax')) {
	    setTimeout(function() {
	        form.find('input[name="group"]:checked').trigger('click');    
	        if(form.hasClass('no_filtercategory')) {
	            form.removeClass('jsFormNoAjax');
	        }
	    }, 1);
	}
	// a.ivanov end
	
	$(document).on('click', 'input[name="group"]', function(){
		$('body input:checkbox').prop('checked', false);
		form.submit();
	});
	$(document).on('click', 'input[name="categories[]"]', function(){
		form.submit();
	})
	form.on('submit', function() {
		//console.log(form.serialize());
		$.ajax({
            type: 'POST',
            url: '/ajax.html',
            dataType: 'json',
        	cache: false,
            data: form.serialize(),
            success: function(data) {
				//console.log(data);
				$('.search-main').css('opacity', 1);
				$('#step-1').html(data.service);
				$('#step-2').html(data.articles);
				$('#step-3').html(data.video);
				$('#step-4').html(data.shorts);
				if (data.direction) {
					$('#step-5-filter').html(data.direction);
				}

				// a.ivanov
				$('.jsGetDiscountButton').on('click', function() {
			      var title = $(this).data('discount');
			      $('#modal_form .jsInputDiscount').val(title);
			    });
			    
			    let form = $('#filter-form');
			    if(form.hasClass('jsFormNoAjax')) {
			        var j = 0;			        
			        var form_category = form.data('category').toString();
			        if(form_category != '') {
			        	if (form_category.indexOf(',') > -1) {
			            	arr_category = form_category.split(',');
			        	} else {
			        		arr_category = [form_category];
			        	}
			        } else {
			            arr_category = [];
			        }
			        var length = arr_category.length;
            	    $('#step-5-filter').find('.search-categories__item').each(function() {
            	        var $this = $(this);
                        for(var i = 0; i < length; i++) {
                            if(arr_category[i] == $this.data('category')) {
                                $this.find('input').prop('checked', true);
                                j = j + 1;
                            }
                        }
            	    });
            	    if(j > 0) {
            	        form.submit();
            	        form.removeClass('jsFormNoAjax');
            	    }
            	}
			    // a.ivanov end
				

				new Swiper(".videos__slider", {
			        spaceBetween: 20,
			        slidesPerView: 3,
			        slidesPerGroup: 1,
			        speed: 800,
			        watchSlidesProgress: true,
			        observer: true,
			        navigation: {
			            nextEl: ".swiper-button-next",
			            prevEl: ".swiper-button-prev",
			        },
			        pagination: {
			            el: ".swiper-pagination",
			            clickable: true,
			        },
			        breakpoints: {
			            0: {
			                slidesPerView: 1.4,
			            },
			            769: {
			                slidesPerView: 2,
			            },
			            1341: {
			                slidesPerView: 3,
			            },
			        }
			    });
			    new Swiper(".shorts__slider", {
			        spaceBetween: 41,
			        slidesPerView: 4,
			        slidesPerGroup: 1,
			        speed: 800,
			        watchSlidesProgress: true,
			        observer: true,
			        navigation: {
			            nextEl: ".swiper-button-next",
			            prevEl: ".swiper-button-prev",
			        },
			        pagination: {
			            el: ".swiper-pagination",
			            clickable: true,
			        },
			        breakpoints: {
			            0: {
			                spaceBetween: 10,
			                slidesPerView: 2.3,
			            },
			            769: {
			                spaceBetween: 22,
			                slidesPerView: 3,
			            },
			            1341: {
			                spaceBetween: 41,
			                slidesPerView: 4,
			            },
			        }
			    });
                
                //var ajax_price = $(data).find('.price_shot_box').html();
                //pg_price.replaceWith(ajax_price);;
            }
            ,error: function(jqXHR, textStatus, errorThrown) {
                    alert(textStatus + ' ' + errorThrown);
            },
            beforeSend : function() {
	            $('.search-main').css('opacity', .5);


	        },
        });
		return false;
	});
});