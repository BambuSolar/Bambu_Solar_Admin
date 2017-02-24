$(function () {

	square_img_product();

	$(window).on('resize',function () {
		square_img_product();		
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
                console.log("The animation was called");
            },
            afterOpen: function() {
                console.log("The animation is completed");
            },
            beforeClose: function() {
                console.log("The animation was called");
            },
            afterClose: function() {
                console.log("The animation is completed");
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


function square_img_product(){

	var img_width = parseInt($('.product').find('.image').width());

	$('.product').find('.image').css('height', img_width);

}


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

