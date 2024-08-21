$(document).ready(function () {
    $.fn.maskPhone = function (config) {
        var objMask = this;
        if (!objMask.length) {
            return false;
        }
        let mask = function (event) {
            let pos = this.selectionStart;
            if (pos < 3) event.preventDefault();
            let matrix = "+1 ___ ___ ____",
                i = 0,
                def = matrix.replace(/\D/g, ""),
                val = this.value.replace(/\D/g, ""),
                new_value = matrix.replace(/[_\d]/g, function (a) {
                    return i < val.length ? val.charAt(i++) || def.charAt(i) : a
                });
            i = new_value.indexOf("_");
            if (i != -1) {
                i < 3 && (i = 3);
                new_value = new_value.slice(0, i);
            }
            let reg = matrix.substr(0, this.value.length).replace(/_+/g,
                function (a) {
                    return "\\d{1," + a.length + "}"
                }).replace(/[+()]/g, "\\$&");
            reg = new RegExp("^" + reg + "$");
            if (!reg.test(this.value) || this.value.length < 5 || event.keyCode > 47 && event.keyCode < 58) {
                this.value = new_value;
            }
            if (event.type == "blur" && this.value.length < 5) {
                this.value = "";
            }
        }
        objMask.each(function (id) {
            if (!$(this).hasClass('is-masked')) {
                this.addEventListener("input", mask, false);
                this.addEventListener("focus", mask, false);
                this.addEventListener("blur", mask, false);
                this.addEventListener("keydown", mask, false);
                this.classList.add("is-masked");
            }
        });
    };


    $.fancybox.defaults.backFocus = false
    $.fancybox.defaults.autoFocus = false
    new Swiper(".main-screen", {
        spaceBetween: 10,
        slidesPerView: 1,
        slidesPerGroup: 1,
        speed: 800,
        effect: "fade",
        autoHeight: true,
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
    });
    new Swiper(".specialist__slider", {
        spaceBetween: 71,
        slidesPerView: 4,
        slidesPerGroup: 1,
        speed: 800,
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
                spaceBetween: 17,
                slidesPerView: 2,
            },
            769: {
                spaceBetween: 41,
                slidesPerView: 3,
            },
            1341: {
                spaceBetween: 71,
                slidesPerView: 4,
            },
        }
    });
    new Swiper(".clinic__slider", {
        spaceBetween: 20,
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
                slidesPerView: 1.4,
            },
            769: {
                slidesPerView: 3,
            },
            1341: {
                slidesPerView: 4,
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

    new Swiper(".search-main__slider", {
        spaceBetween: 0,
        slidesPerView: "auto",
        slidesPerGroup: 1,
        speed: 800,
        allowTouchMove: false,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
        },
        breakpoints: {
            0: {
                allowTouchMove: true,
                slidesPerView: 1.4,
                spaceBetween: 14,
            },
            769: {
                allowTouchMove: true,
                slidesPerView: "auto",
                spaceBetween: 0,
            },
            1025: {
                allowTouchMove: false,
                slidesPerView: "auto",
                spaceBetween: 0,
            },

        }
    });

    $('.jsTel').maskPhone();
    $('.jsTwenty').twentytwenty();
    $(document).on('click', '.jsOpenModal', function (e) {
        let objButton = $(this);
        e.preventDefault();
        $.fancybox.open({
            src: objButton.data('url'),
            type: 'ajax',
            opts: {
                touch: false,
                afterLoad: function (instance, current) {
                    let objSource = current.$content;
                    objSource.find('.jsTel').maskPhone();
                },
            }
        });
    });
    $(document).on('click', '.jsOpenShort', function (e) {
        let objButton = $(this);
        e.preventDefault();
        $.fancybox.open({
            src: objButton.data('url'),
            width: "100%",
            height: "90vh",
            autoSize: false,
            scrolling: false,
            opts: {
                touch: false,
            }
        });
    })
    $(document).on('click', '.jsTogglerHead', function () {
        $(this).toggleClass('active');
        $(this).next('.jsTogglerBody').slideToggle();
    })

    $(document).on('click', '.jsBurger', function () {
        $('.jsMenu, .jsBurger').toggleClass('active');
        $('.jsSearchIcon, .jsHeaderSearch').removeClass('active')
    })

    $(document).on('click', '.jsAnchorLink', function () {
        let anchor = $(this).attr('href');
        $('html, body').animate({
            scrollTop: $(anchor).offset().top - 40
        }, 600);
        return false;
    })
    $(document).on('click', '.jsCutBtn', function () {
        $(this).closest('.jsContentBlock').addClass('visible')
    })
    $(document).on('click', '.jsSearchIcon', function () {
        $('.jsSearchIcon, .jsHeaderSearch').toggleClass('active')
        $('.jsBurger, .jsMenu').removeClass('active');
    })
})

