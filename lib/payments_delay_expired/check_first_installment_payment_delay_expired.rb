#include SharedUtils::ExcerciseYearMixin

module CheckFirstInstallmentPaymentDelayExpired
    def   check_first_installment_payment_delay_expired(current_excercise)
        # Get payments config.
        #payment_delays_config = PaymentDelay.where(excercise_year_id: current_excercise).take
        payment_delays_config = PaymentDelay.take
        #FIRST_INSTALLMENT = [["Début mois suivant (+15 jours)"],["Fin mois suivant"], ["+1 Mois et 15 jours"], ["Fin du 2ème mois"]]
        first_installment_config = PaymentDelay::FIRST_INSTALLMENT

        puts "FIRST INSTALLMENT CONFIG:#{first_installment_config}"

        if payment_delays_config
           
            puts "PAYMENT DELAYS CONFIG:#{payment_delays_config.inspect}"
    
            first_installment = payment_delays_config.first_installment
            #puts "FIRST INSTALLMENT DELAY: #{first_installment}"
           
        else
            puts "EXITING..."
           #return
        end



        # All credits
        credits = Credit.where(excercise_year_id: current_excercise)
        
        # For all credits
        if credits
            credits.each do |credit|
                acte_date = credit.acte_date
                
                if acte_date
                    current_date = Time.now.strftime("%d/%m/%Y")
                    acte_date_day = acte_date.day
                    acte_date_moth = acte_date.month
                    acte_date_year = acte_date.year

                    expiration_date = nil

                    # Début mois suivant (+15 jours)
                    puts "CURRENT VALUE: #{first_installment_config[1][0]}"
                    if first_installment.present? && first_installment == first_installment_config[0][0]
                        
                        
                        puts "Début mois suivant (+15 jours) "

                        #Add +15jours
                        expiration_date = acte_date + 15.day
                       
                       # Add 1 month
                        expiration_date = expiration_date + 1.month
                        expiration_date = expiration_date.strftime("%d/%m/%Y")
                        puts "Expiration date: #{expiration_date.strftime("%d/%m/%Y")}"


                    # Fin mois suivant
                    elsif   first_installment.present? && first_installment == first_installment_config[1][0]
                        puts "Fin mois suivant "

                       # Add 1 month
                        expiration_date = acte_date + 1.month
                        
                        # End of month
                        expiration_date = expiration_date.end_of_month.strftime("%d/%m/%Y")
                        puts "Expiration date: #{expiration_date}"


                    # +1 Mois et 15 jours
                    elsif first_installment.present? && first_installment == first_installment_config[2][0]
                        puts "+1 Mois et 15 jours"

                         #Add +15jours
                         expiration_date = acte_date + 15.day
                       
                         # Add 1 month
                          expiration_date = expiration_date + 1.month
                          expiration_date = expiration_date.strftime("%d/%m/%Y")
                          puts "Expiration date: #{expiration_date.strftime("%d/%m/%Y")}"

                    #Fin du 2ème mois
                    elsif first_installment.present? && first_installment == first_installment_config[3][0]
                        puts "Fin du 2ème mois"

                        # Add 1 month
                        expiration_date = acte_date + 2.month
                        expiration_date = expiration_date.end_of_month.strftime("%d/%m/%Y")
                        puts "Expiration date: #{expiration_date.strftime("%d/%m/%Y")}"

                    end

                    # If expired, add credit to the expiration table.
                    if current_date == expiration_date
                        #Get credit details
                        credit_details = CreditDetail.where(["excercise_year_id = ? AND credit_identifier = ? AND installment_payment = ?", current_excercise, credit.identifier, "Première tranche"]).take
                        
                        if credit_details.present? && credit_details.paid_by_bank == "Non"

                            first_installment_payment_delay_expired = FirstInstallmentPaymentDelayExpired.new
                            first_installment_payment_delay_expired.credit_identifier = credit.identifier
                            first_installment_payment_delay_expired.expiration_date = expiration_date
                            first_installment_payment_delay_expired.credit_amount = credit.amount
                            first_installment_payment_delay_expired.installment_amount = credit_details.commission
                            first_installment_payment_delay_expired.user_id = current_user.id
                            first_installment_payment_delay_expired.save

                        end
                    end
                   


                end
            end
        end
        #puts "All: #{credits.inspect}"
        puts "YES"
    end
end