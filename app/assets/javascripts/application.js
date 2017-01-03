
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree ./MaterialDesign/bootstrap
//= require_tree ./MaterialDesign/bootstrap-select
//= require_tree ./MaterialDesign/jquery-slimscroll
//= require_tree ./MaterialDesign/jquery-validation
//= require_tree ./MaterialDesign/sweetalert
//= require_tree ./MaterialDesign/node-waves
//= require ./MaterialDesign/admin
//= require ./MaterialDesign/helpers

$(function () {
    $('.form_validation').validate({
        rules: {
            'checkbox': {
                required: true
            },
            'gender': {
                required: true
            }
        },
        highlight: function (input) {
            $(input).parents('.form-line').addClass('error');
        },
        unhighlight: function (input) {
            $(input).parents('.form-line').removeClass('error');
        },
        errorPlacement: function (error, element) {
            $(element).parents('.form-group').append(error);
        }
    });

    //Advanced Form Validation
    $('.form_advanced_validation').validate({
        rules: {
            'date': {
                customdate: true
            },
            'creditcard': {
                creditcard: true
            }
        },
        highlight: function (input) {
            $(input).parents('.form-line').addClass('error');
        },
        unhighlight: function (input) {
            $(input).parents('.form-line').removeClass('error');
        },
        errorPlacement: function (error, element) {
            $(element).parents('.form-group').append(error);
        }
    });

    //Custom Validations ===============================================================================
    //Date
    $.validator.addMethod('customdate', function (value, element) {
            return value.match(/^\d\d\d\d?-\d\d?-\d\d$/);
        },
        'Please enter a date in the format YYYY-MM-DD.'
    );

    //Credit card
    $.validator.addMethod('creditcard', function (value, element) {
            return value.match(/^\d\d\d\d?-\d\d\d\d?-\d\d\d\d?-\d\d\d\d$/);
        },
        'Please enter a credit card in the format XXXX-XXXX-XXXX-XXXX.'
    );
    //==================================================================================================
});


//Override the default confirm dialog by rails
    $.rails.allowAction = function (link) {
        console.log(link);
        if (link.data("confirm") == undefined) {
            return true;
        }
        $.rails.showConfirmationDialog(link);
        return false;
    };
//User click confirm button
    $.rails.confirmed = function (link) {
        link.data("confirm", null);
        link.trigger("click.rails");
    };
//Display the confirmation dialog
    $.rails.showConfirmationDialog = function (link) {
        swal({
            title: '¿Está seguro que desea realizar la eliminación?',
            text: "Esta acción no puede deshacerse",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#fb483a',
            cancelButtonColor: '#DD6B55',
            confirmButtonText: 'Aceptar',
            cancelButtonText: 'Cancelar',
            closeOnConfirm: false,
            closeOnCancel: false
        }, function (isConfirm) {
            if (isConfirm) {

                swal("Deleted!",
                    "El archivo ha sido eliminado",
                    "success"
                );
                swal({
                    title: "Eliminado",
                    text: "El archivo ha sido eliminado",
                    type: "success"
                }, function () {
                    $.rails.confirmed(link);
                });
            } else {
                swal("Cancelado", "La operación ha sido cancelada", "error");
            }
        });

    };