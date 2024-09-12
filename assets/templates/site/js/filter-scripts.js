$(document).ready(function() {
	let form = $('#filter-form');
	$(document).on('click', 'input[name="group"]', function(){
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