
$(document).on('turbolinks:load', function() {
	$('#bank-setting-modal').on('shown.bs.modal', function() {
        
        $("#bank_setting_commission_percentage").on('focusout', function(){
            bank_setting_commission_percentage = $('#bank_setting_commission_percentage').val();
            old_rate = $('#old_rate').val();

            // Checking.
            if (bank_setting_commission_percentage != null && bank_setting_commission_percentage != old_rate){
               
                $("#commission_start_date").css("display", "block");
                $("#commission_start_date_label").css("display", "block");

                $("#commission_start_date").css("background-color", "red");
                $("#commission_start_date").css("color", "white");

                $("#commission_was_changed").val("true");

            }

            if (bank_setting_commission_percentage != null && bank_setting_commission_percentage == old_rate){
               
                $("#commission_start_date").css("display", "none");
                $("#commission_start_date_label").css("display", "none");

                $("#commission_was_changed").val("false");
                

            }
         
        });

        // 
        $("#bank_setting_first_installment").on('focusout', function(){
            bank_setting_first_installment = $('#bank_setting_first_installment').val();
            if (bank_setting_first_installment >= 1 && bank_setting_first_installment <= 100){
                bank_setting_number_of_remaining_days = 100 - bank_setting_first_installment ;
                $("#bank_setting_number_of_remaining_days").val(bank_setting_number_of_remaining_days);
            }
            
        });

      
    })
});