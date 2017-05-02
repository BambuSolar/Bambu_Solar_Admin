$(function () {

    homeBackgroundSize();

    bgResponsive();

    $(window).on('resize', function () {
        homeBackgroundSize();
        bgResponsive();
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
