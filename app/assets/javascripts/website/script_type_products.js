$(function () {

	square_img_product();

	$(window).on('resize',function () {
		square_img_product();		
	});

	$(".product_modal_btn").animatedModal({
		modalTarget:'product_modal',
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