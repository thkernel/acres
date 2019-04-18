
$(document).on('turbolinks:load', function() {
	$('#bank-modal').on('shown.bs.modal', function() {
        /*$("#bank_commission_percentage").on('focusout', function(){
            $("#bank_date_effet").css("visibility", "visible");
            $("#bank_date_effet").css("display", "block");
        });*/

        $("#bank_commission_percentage").on('focusout', function(){
            bank_commission_percentage = $('#bank_commission_percentage').val();
            old_rate = $('#old_rate').val();

            // Checking.
            if (bank_commission_percentage != null && bank_commission_percentage != old_rate){
               
                $("#commission_start_date").css("display", "block");
                $("#commission_start_date_label").css("display", "block");

                $("#commission_start_date").css("background-color", "red");
                $("#commission_start_date").css("color", "white");

                $("#commission_was_changed").val("true");

            }

            if (bank_commission_percentage != null && bank_commission_percentage == old_rate){
               
                $("#commission_start_date").css("display", "none");
                $("#commission_start_date_label").css("display", "none");

                $("#commission_was_changed").val("false");
                

            }
         
        });

        
        bank_first_installment = $('#bank_first_installment').val();
        if (bank_first_installment >= 1 && bank_first_installment <= 100){
            bank_number_of_remaining_days = 100 - bank_first_installment ;
            $("#bank_number_of_remaining_days").val(bank_number_of_remaining_days);
        }
      
    })
});
