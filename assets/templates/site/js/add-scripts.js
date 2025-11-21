(function (win, $) {
	if (!$) {
		return;
	}

	var resendTimerInterval = null;
	var reviewHandlerBound = false;
	var cookieHandlersBound = false;

	function onReady(callback) {
		if (document.readyState === 'loading') {
			document.addEventListener('DOMContentLoaded', callback, { once: true });
		} else {
			callback();
		}
	}

	function runIdle(callback, timeout) {
		if ('requestIdleCallback' in win) {
			requestIdleCallback(function () { callback(); }, { timeout: timeout || 1000 });
		} else {
			setTimeout(callback, timeout || 0);
		}
	}

	function initFaqPreview() {
		var $faqItems = $('.blog-content .faq__item .faq__item-body.jsTogglerBody');
		if ($faqItems.length) {
			$faqItems.eq(0).show();
		}
	}

	function bindMoreReviews() {
		if (reviewHandlerBound) {
			return;
		}
		reviewHandlerBound = true;
		$(document).on('click', '.jsMorereview', function (event) {
			event.preventDefault();
			var $button = $(this);
			var masterId = $button.attr('data-master');
			var currentCount = parseInt($button.attr('data-count'), 10) || 0;
			$.ajax({
				type: 'POST',
				url: '/ajax-more.html',
				dataType: 'json',
				cache: false,
				data: { starmore: currentCount, master_id: masterId },
				beforeSend: function () {
					$('.reviews__content').css('opacity', 0.5);
				},
				success: function (data) {
					$('.reviews__content').css('opacity', 1);
					if (!data || !data.service) {
						return;
					}
					var nextCount = currentCount + 3;
					$button.attr('data-count', nextCount);
					$('.reviews__content').append(data.service);
					if (data.allcount && nextCount >= data.allcount) {
						$button.remove();
					}
				},
				error: function (jqXHR, textStatus, errorThrown) {
					alert(textStatus + ' ' + errorThrown);
				}
			});
		});
	}

	function bindCookieButtons() {
		if (cookieHandlersBound) {
			return;
		}
		cookieHandlersBound = true;
		$(document).on('click', '.cky-btn-accept, .cky-btn-reject', function () {
			$('.cky-box-bottom-left').remove();
			if ($.cookie) {
				$.cookie('accept', 'accept', { expires: 7 });
			}
		});
	}

	function collapseSpecialistLists() {
		runIdle(function () {
			$('.specialist-item').each(function () {
				var $item = $(this);
				var $rows = $item.find('.specialist-item__body ul li');
				var maxVisible = 4;
				if ($rows.length > maxVisible) {
					$rows.slice(maxVisible).hide();
					var url = $item.attr('href');
					$item.find('.specialist-item__body ul').append('<a href="' + url + '" class="read">see more</a>');
				}
			});
		}, 250);
	}

	function startResendTimer() {
		if (resendTimerInterval) {
			clearInterval(resendTimerInterval);
			resendTimerInterval = null;
		}
		var seconds = 60;
		$('#timer_countdown').text(seconds);
		$('#resend_timer').show();
		$('#resend_link').hide();
		resendTimerInterval = setInterval(function () {
			seconds -= 1;
			$('#timer_countdown').text(seconds);
			if (seconds <= 0) {
				clearInterval(resendTimerInterval);
				resendTimerInterval = null;
				$('#resend_timer').hide();
				$('#resend_link').show();
			}
		}, 1000);
	}

	function handleAjaxComplete() {
		$(document).on('af_complete', function (event, response) {
			if (!response || !response.form) {
				return;
			}
			var form = response.form;
			var formId = form.attr('id');
			if (formId === 'modal_form' && response.success && $.fancybox) {
				$.fancybox.close();
				$.fancybox.open('<div class="message"><p>Thank you for your request. Our manager will contact you shortly.</p></div>');
			}
			if (formId === 'modal_form_discount') {
				handleDiscountFormResponse(form, response);
			}
			if (formId === 'feedback_form' && response.success && $.fancybox) {
				$.fancybox.open('<div class="message"><p>Thank you for your request. Our manager will contact you shortly.</p></div>');
			}
		});
	}

	function handleDiscountFormResponse(form, response) {
		if (response.success) {
			if ($.fancybox) {
				$.fancybox.close();
				$.fancybox.open('<div class="message"><p>Thank you for your request. Our manager will contact you shortly.</p></div>');
			}
			$.ajax({
				type: 'POST',
				url: '/ajax-discount.html',
				dataType: 'json',
				cache: false,
				data: { action: 'getDiscount' },
				success: function () {
					var group = $('#filter-form input[name=group]:checked').val() || '';
					var category = [];
					$('#step-5-filter input[type=checkbox]:checked').each(function () {
						category.push($(this).val());
					});
					var url = form.attr('action') || '';
					if (group) {
						url += (url.indexOf('?') === -1 ? '?' : '&') + 'filtergroup=' + group;
					}
					if (category.length) {
						url += (url.indexOf('?') === -1 ? '?' : '&') + 'filtercategory=' + category.join(',');
					}
					var anchor = url.indexOf('to-concern') !== -1 ? '#step-1' : '#prices';
					document.location.href = url + anchor;
				},
				error: function (jqXHR, textStatus, errorThrown) {
					alert(textStatus + ' ' + errorThrown);
				}
			});
			return;
		}
		var smsMessage = response.data && response.data.sms_code;
		if (!smsMessage) {
			return;
		}
		if (smsMessage.indexOf('Check your phone') !== -1 ||
			(smsMessage.indexOf('verification code') !== -1 && smsMessage.indexOf('incorrect') === -1)) {
			$('#panel_1').hide();
			$('#panel_2').show();
			startResendTimer();
			$('.jsSmsRepeat').off('click').on('click', function (event) {
				event.preventDefault();
				$('#resend_link').hide();
				$('#resend_timer').show();
				$('#smsCode').val('');
				$('#panel_2').find('input[name=repeat_sms]').remove();
				$('#panel_2').append('<input type="hidden" name="repeat_sms" value="1">');
				form.find('button[type="submit"]').trigger('click');
				setTimeout(function () { startResendTimer(); }, 500);
			});
		} else {
			$('.error_sms_code').html(smsMessage).show();
		}
	}

	function bindAjaxVideo() {
		$(document).on('click', '.ajaxVideoJS, .ajaxVideoShortsJS', function (event) {
			event.preventDefault();
			var $trigger = $(this);
			var resourceId = $trigger.data('id');
			var action = $trigger.hasClass('ajaxVideoShortsJS') ? 'videoShorts' : 'video';
			$.ajax({
				type: 'POST',
				url: '/ajax-video.html',
				dataType: 'json',
				cache: false,
				data: { action: action, resource_id: resourceId },
				success: function (data) {
					if (data && data.text && $.fancybox) {
						$.fancybox.open('<div class="modal style_popup_content">' + data.text + '</div>');
					}
				},
				error: function (jqXHR, textStatus, errorThrown) {
					alert(textStatus + ' ' + errorThrown);
				}
			});
		});
	}

	function bindCheckboxValidation() {
		$(document).on('click', '#modal_form_discount #get_code_btn', function (event) {
			var $form = $(this).closest('form');
			var $checkbox = $form.find('input[name="politikmodal"]');
			var panelVisible = $('#panel_1').is(':visible');
			if (panelVisible && !$checkbox.is(':checked')) {
				event.preventDefault();
				event.stopImmediatePropagation();
				var $container = $checkbox.closest('.form__item');
				$container.find('.privacy-error').remove();
				$container.append('<span class="privacy-error" style="color:#ea6852; font-size:13px; display:block; margin-top:8px;">Please agree to the Privacy Policy to continue*</span>');
			} else {
				$form.find('.privacy-error').remove();
			}
		});

		$(document).on('submit', '#modal_form_discount', function (event) {
			var $form = $(this);
			var $checkbox = $form.find('input[name="politikmodal"]');
			var panelVisible = $('#panel_1').is(':visible');
			if (panelVisible && !$checkbox.is(':checked')) {
				event.preventDefault();
				event.stopImmediatePropagation();
			}
		});
	}

	function bindAjaxFormAjaxComplete() {
		$(document).on('mse2_load', function () {
			if ($.fn.twentytwenty) {
				$('.jsTwenty').twentytwenty();
			}
		});
	}

	function handleHashScroll() {
		win.addEventListener('load', function () {
			if (win.location.hash === '#step-1' && win.location.pathname.indexOf('to-concern') !== -1) {
				var attempts = 0;
				var intervalId = setInterval(function () {
					attempts += 1;
					var servicesHeading = document.querySelector('#step-1 .main-heading');
					if (servicesHeading && servicesHeading.textContent.indexOf('Services') !== -1) {
						clearInterval(intervalId);
						requestAnimationFrame(function () {
							var headingTop = servicesHeading.getBoundingClientRect().top + win.scrollY;
							var target = headingTop - (win.innerHeight * 0.15);
							win.scrollTo({ top: target, behavior: 'smooth' });
						});
					}
					if (attempts >= 50) {
						clearInterval(intervalId);
					}
				}, 100);
			}
		});
	}

	onReady(function () {
		initFaqPreview();
		bindMoreReviews();
		bindCookieButtons();
		collapseSpecialistLists();
		handleAjaxComplete();
		bindAjaxVideo();
		bindCheckboxValidation();
		bindAjaxFormAjaxComplete();
	});

	handleHashScroll();

	win.startResendTimer = startResendTimer;
}(window, window.jQuery));
