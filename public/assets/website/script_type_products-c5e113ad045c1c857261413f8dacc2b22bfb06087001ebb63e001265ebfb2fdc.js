var product_id = 0;

$(function () {

    $('.list_product_categories').find('ul').find('li').on('click', function () {

        var p_c_id = $(this).attr('data-id');

        set_select_product_category(p_c_id);

    });

    var p_c_id = $($('.list_product_categories').find('ul').find('li')[0]).attr('data-id');

    set_select_product_category(p_c_id);

    square_img_product();

    $(window).on('resize',function () {
        square_img_product();
        ajust_size_iframe();
    });

    $('.product_modal_btn').on('click', function () {
        product_id = $(this).attr('data-id');
    });

    $(".product_modal_btn").animatedModal({
        modalTarget:"product_modal",
        animatedIn:'zoomIn',
        animatedOut:'zoomOut',
        color:'#ffffff',
        // Callbacks
        beforeOpen: function() {
            $('#cover_modal').show();
            $.getJSON('/info/products/' + product_id + '.json', function (data) {
                render_product_modal(data);
                $('#product_modal').find('.modal-loading').hide();
                $('#product_modal').find('.modal-content').show();
            })
        },
        afterOpen: function() {
        },
        beforeClose: function() {
            $('#cover_modal').hide();
        },
        afterClose: function() {
            $('#product_modal').find('.modal-content').hide();
            $('#product_modal').find('.modal-loading').show();
        }
    });

    $('.cover_modal').on('click',function () {

        $("#product_modal").css({
            'z-index': -9999,
            'opacity': 0
        });
        $(this).hide();
        $('body, html').css({'overflow':'auto'});

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
    openFullscreen: false,
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

function render_product_modal(product) {

    $('#product_modal').find('h1.title').text(product.name);
    $('#product_modal').find('p.description').text(product.description);

    if(!product.to_quote) {
        $('#product_modal').find('p.price').text(product.price);
    }else{
        $('#product_modal').find('p.price').text('A cotizar');
    }
    $('#product_modal').find('div.modal-content').find('div.description_detail').html(product.description_detail);

    $('#product_modal').find('.pictures').find('img').attr('src', product.picture);
}


function set_select_product_category(p_c_id) {

    $('.product_category_container > div').hide();
    $('.product_category_container').find('.category_id_' + p_c_id).show();

    $('.list_product_categories').find('ul').find('li.selected').removeClass('selected');

    $('.product_category_' + p_c_id).addClass('selected');

}
;
