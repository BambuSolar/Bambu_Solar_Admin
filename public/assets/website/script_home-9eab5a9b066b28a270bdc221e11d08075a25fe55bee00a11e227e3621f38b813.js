var ourwork_images_urls = [];

$(function () {

    homeBackgroundSize();

    bgResponsive();

    $(window).on('resize', function () {
        homeBackgroundSize();
        bgResponsive();
    });

    $('#contact').find('iframe').height($('#contact').find('.main_contact_info').height());

    $('.ourWorkSlider').slick({
        autoplay:true,
        autoplaySpeed:1500,
        arrows:true,
        prevArrow:'<button type="button" class="slick-prev"><i class="fa fa-chevron-left" aria-hidden="true"></i></button>',
        nextArrow:'<button type="button" class="slick-next"><i class="fa fa-chevron-right" aria-hidden="true"></i></button>',
        centerMode:true,
        slidesToShow:5,
        slidesToScroll:1,
        lazy_load : "ondemand",
        responsive: [
            {
                breakpoint: 768,
                settings: {
                    arrows: true,
                    slidesToShow: 3
                }
            },
            {
                breakpoint: 480,
                settings: {
                    arrows: false,
                    slidesToShow: 1
                }
            }]
    });

    $.getJSON("/info/ourworks.json", function (images) {

        var img_htmls = [];

        $.each(images.data, function (i, image) {

            ourwork_images_urls.push({"src": image.url});

            img_htmls.push($('<img class="img-responsive" alt="Nuestro Trabajo ' + i + '" data-url="' + image.url + '" />').attr('src', image.thumb));

            img_htmls[i].on('load', function(e) {

                var img = e.target.outerHTML;

                if (!this.complete || typeof this.naturalWidth == "undefined" || this.naturalWidth == 0) {
                    alert('broken image!');
                } else {

                    var new_slide = '<div class="slide">' + img  + '</div>';

                    $('.ourWorkSlider').slick('slickAdd', new_slide);

                    $('.ourWorkSlider').find('img').on('click', function () {

                        $.magnificPopup.open({
                            items: {
                                src: $(this).attr('data-url')
                            },
                            closeOnContentClick: true,
                            closeOnBgClick: true,
                            showCloseBtn: false,
                            enableEscapeKey: true,
                            type: 'image'
                        });

                    });

                }
            });
        });

    });

    smoothScrolling();

});

function homeBackgroundSize() {
    var home_skew_border = $('.home_skew_border');

    home_skew_border.css('height', $(window).height());

    var main_home = home_skew_border.find('.main_home');

    main_home.css('top', ($(window).height() - main_home.height())/2);
}

function bgResponsive(){

    var w_width = $(window).width();
    var w_height = $(window).height();

    if(w_height < w_width){

        $('.home').attr('style', 'background-image: url("' + bgH + '")');

    }else{

        $('.home').attr('style', 'background-image: url("' + bgV + '")');

    }

}

function smoothScrolling() {
    // Select all links with hashes
    $('a[href*="#"]')
    // Remove links that don't actually link to anything
        .not('[href="#"]')
        .not('[href="#0"]')
        .click(function(event) {
            // On-page links
            if (
                location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '')
                &&
                location.hostname == this.hostname
            ) {
                // Figure out element to scroll to
                var target = $(this.hash);
                target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
                // Does a scroll target exist?
                if (target.length) {
                    // Only prevent default if animation is actually gonna happen
                    event.preventDefault();
                    $('html, body').animate({
                        scrollTop: target.offset().top
                    }, 1000);
                }
            }
        });
}
;
