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
        slidesToShow:3,
        slidesToScroll:1,
        lazy_load : "ondemand"
    });

    $.getJSON("/info/ourworks.json", function (images) {

        var img_htmls = [];

        $.each(images.data, function (i, image) {

            img_htmls.push($('<img class="img-responsive" />').attr('src', image.thumb));

            img_htmls[i].on('load', function(e) {

                var img = e.target.outerHTML;

                if (!this.complete || typeof this.naturalWidth == "undefined" || this.naturalWidth == 0) {
                    alert('broken image!');
                } else {

                    var new_slide = '<div class="slide">' + img  + '</div>';

                    $('.ourWorkSlider').slick('slickAdd', new_slide);

                }
            });
        });

    });

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
;
