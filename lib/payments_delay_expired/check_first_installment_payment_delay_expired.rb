#include SharedUtils::ExcerciseYearMixin

module CheckFirstInstallmentPaymentDelayExpired
    def   check_first_installment_payment_delay_expired(current_excercise)
        # Get payments config.
        #payment_delays_config = PaymentDelay.where(excercise_year_id: current_excercise).take
        payment_delays_config = PaymentDelay.take
        #FIRST_INSTALLMENT = [["Début mois suivant (+15 jours)"],["Fin mois suivant"], ["+1 Mois et 15 jours"], ["Fin du 2ème mois"]]
        first_installment_config = PaymentDelay::FIRST_INSTALLMENT

        #puts "FIRST INSTALLMENT CONFIG:#{first_installment_config}"

        if payment_delays_config
           
            #puts "PAYMENT DELAYS CONFIG:#{payment_delays_config.inspect}"
    
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
                    #puts "CURRENT VALUE: #{first_installment_config[1][0]}"
                    if first_installment.present? && first_installment == first_installment_config[0][0]
                        
                        
                        puts "Début mois suivant (+15 jours) "

                        #Add +15jours
                        expiration_date = acte_date + 15.day
                       
                       # Add 1 month
                        expiration_date = expiration_date + 1.month
                        expiration_date = expiration_date.strftime("%d/%m/%Y")
                        #puts "Expiration date: #{expiration_date.strftime("%d/%m/%Y")}"


                    # Fin mois suivant
                    elsif   first_installment.present? && first_installment == first_installment_config[1][0]
                        #puts "Fin mois suivant "

                       # Add 1 month
                        expiration_date = acte_date + 1.month
                        
                        # End of month
                        expiration_date = expiration_date.end_of_month.strftime("%d/%m/%Y")
                        #puts "Expiration date: #{expiration_date}"


                    # +1 Mois et 15 jours
                    elsif first_installment.present? && first_installment == first_installment_config[2][0]
                        #puts "+1 Mois et 15 jours"

                         #Add +15jours
                         expiration_date = acte_date + 15.day
                       
                         # Add 1 month
                          expiration_date = expiration_date + 1.month
                          expiration_date = expiration_date.strftime("%d/%m/%Y")
                          #puts "Expiration date: #{expiration_date.strftime("%d/%m/%Y")}"

                    #Fin du 2ème mois
                    elsif first_installment.present? && first_installment == first_installment_config[3][0]
                        #puts "Fin du 2ème mois"

                        # Add 1 month
                        expiration_date = acte_date + 2.month
                        expiration_date = expiration_date.end_of_month.strftime("%d/%m/%Y")
                        #puts "Expiration date: #{expiration_date.strftime("%d/%m/%Y")}"

                    end

                    # If expired, add credit to the expiration table.
                    #if current_date == expiration_date
                        #Get credit details
                        payment_timetables = PaymentTimetable.where(["excercise_year_id = ? AND credit_identifier = ?", current_excercise, credit.identifier.to_s])

                        if payment_timetables
                            payment_timetables.each do |payment_timetable|
                                payment_timetable_details = PaymentTimetableDetail.where(["payment_timetable_id = ? AND paid_by_bank = ? AND installment_payment = ?",  payment_timetable.id,  "Oui",  "Première tranche "])
                                #puts "PAYMENT TIMETABLE DETAILS: #{payment_timetable_details.inspect}"
                                i = 0
                                payment_timetable_details.each do |payment_timetable_detail|
                                    
                                    #if  payment_timetable_detail.paid_by_bank == "Oui"

                                    first_installment_payment_delay_expireds = FirstInstallmentPaymentDelayExpired.where(["credit_identifier = ? AND excercise_year_id = ? AND target = ? AND installment = ?", credit.identifier, current_excercise, payment_timetable.target, payment_timetable_detail.installment_payment ])
                                        
                                        unless first_installment_payment_delay_expireds.present?

                                            first_installment_payment_delay_expired = FirstInstallmentPaymentDelayExpired.new
                                            
                                            first_installment_payment_delay_expired.installment = payment_timetable_detail.installment_payment
                                            first_installment_payment_delay_expired.credit_identifier = payment_timetable.credit_identifier
                                            first_installment_payment_delay_expired.expiration_date = expiration_date
                                            first_installment_payment_delay_expired.target = payment_timetable.target
                                            first_installment_payment_delay_expired.payment_amount = payment_timetable_detail.commission
                                            first_installment_payment_delay_expired.excercise_year_id = current_excercise

                                            first_installment_payment_delay_expired.user_id = credit.user_id
                                            
                                            
                                            if generate_bordereau?(credit, payment_timetable, payment_timetable_detail, current_excercise)

                                                first_installment_payment_delay_expired.save
                                            end
                                        end
                                    #end 
                                end
                            end

                        end
                    #end
                   


                end
            end
        end
        #puts "All: #{credits.inspect}"
        puts "YES"
    end
end