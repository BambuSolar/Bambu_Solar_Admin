$(function () {

    square_img_product();

    $(window).on('resize',function () {
        square_img_product();
        ajust_size_iframe();
    });

    $(".product_modal_btn").animatedModal();

    $("#product_modal_2_btn").animatedModal({
        modalTarget: 'product_modal_2'
    });

    $.each(gon.products, function(index, item){

        $("#product_modal_" + item.id + "_btn").animatedModal({
            modalTarget:"product_modal_" + item.id,
            animatedIn:'zoomIn',
            animatedOut:'zoomOut',
            color:'#57936d',
            // Callbacks
            beforeOpen: function() {
            },
            afterOpen: function() {
                $('.culmn').hide();
            },
            beforeClose: function() {
                $('.culmn').show();
            },
            afterClose: function() {
            }
        });

    });

    $('.screen').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        fade: true,
        asNavFor: '.thumbnails'
    });

    $('.thumbnails').slick({
        slidesToShow: 3,
        slidesToScroll: 1,
        asNavFor: '.screen',
        dots: true,
        centerMode: true,
        focusOnSelect: true
    });

    ajust_size_iframe();

});


$('#modal-contact').iziModal({
    title: 'Contactanos',
    icon: 'fa fa-phone',
    attached: 'bottom',
    headerColor: '#e18718',
    iconColor: 'white',
    fullscreen: false,
    openFullscreen: true,
    zindex: 20000
});

$(document).on('click', '.modal-contact-btn', function (event) {
    event.preventDefault();
    $('#modal-contact').iziModal('open');
});

$(window).scroll(function(event){
    var st = $(this).scrollTop();

    if (st > 100){

        // downscroll code

        $('#slider_type_products').addClass('mini');

    } else {
        // upscroll code
        $('#slider_type_products').removeClass('mini');

    }

});

function square_img_product(){

    var img_width = parseInt($('.product').find('.image').width());

    $('.product').find('.image').css('height', img_width);

}

function ajust_size_iframe() {

    var iframe = $('iframe');

    iframe.height($(iframe.parents()[2]).find('img').height());
    iframe.width($(iframe.parents()[2]).find('img').width());
}



;
