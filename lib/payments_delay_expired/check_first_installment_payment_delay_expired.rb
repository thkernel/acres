#include SharedUtils::ExcerciseYearMixin

module CheckFirstInstallmentPaymentDelayExpired
    def   check_first_installment_payment_delay_expired(current_excercise)
        # All credits
        
        credits = Credit.where(excercise_year_id: current_excercise)
        puts "All: #{credits.inspect}"
        puts "YES"
    end
end