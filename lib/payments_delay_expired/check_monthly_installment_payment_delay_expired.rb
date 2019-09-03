
#include GenerateBordereau


module CheckMonthlyInstallmentPaymentDelayExpired

	def  check_monthly_installment_payment_delay_expired(current_excercise)
        # Get payments config.
        #payment_delays_config = PaymentDelay.where(excercise_year_id: current_excercise).take
        payment_delays_config = PaymentDelay.take
        #FIRST_INSTALLMENT = [["Début mois suivant (+15 jours)"],["Fin mois suivant"], ["+1 Mois et 15 jours"], ["Fin du 2ème mois"]]
        #MONTHLY_INSTALLMENTS = [["Mois suivant (+15 jours)"], ["+1 mois et 15 jours"], ["Fin du 2ème mois"]]

        monthly_installments_config = PaymentDelay::MONTHLY_INSTALLMENTS

        #puts "MONTHLY PAYMENT CONFIG:#{monthly_installments_config}"

        if payment_delays_config
           
            #puts "PAYMENT DELAYS CONFIG:#{payment_delays_config.inspect}"
    
            monthly_installment = payment_delays_config.monthly_installments
            #puts "MONTHLY_INSTALLMENTS: #{monthly_installment}"
           
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

                    # Mois suivant (+15 jours)
                    #puts "CURRENT VALUE: #{monthly_installments_config[1][0]}"
                    if monthly_installment.present? && monthly_installment == monthly_installments_config[0][0]
                        
                        
                        #puts "Mois suivant (+15 jours)" 

                        #Add +15jours
                        expiration_date = acte_date + 15.day
                       
                       # Add 1 month
                        expiration_date = expiration_date + 1.month
                        expiration_date = expiration_date.strftime("%d/%m/%Y")
                        #puts "Expiration date: #{expiration_date.strftime("%d/%m/%Y")}"


                    # +1 Mois et 15 jours
                    elsif monthly_installment.present? && monthly_installment == monthly_installments_config[2][0]
                        #puts "+1 Mois et 15 jours"

                         #Add +15jours
                         expiration_date = acte_date + 15.day
                       
                         # Add 1 month
                          expiration_date = expiration_date + 1.month
                          expiration_date = expiration_date.strftime("%d/%m/%Y")
                          #puts "Expiration date: #{expiration_date.strftime("%d/%m/%Y")}"

                    #Fin du 2ème mois
                    elsif monthly_installment.present? && monthly_installment == monthly_installments_config[3][0]
                        #puts "Fin du 2ème mois"

                        # Add 1 month
                        expiration_date = acte_date + 2.month
                        expiration_date = expiration_date.end_of_month.strftime("%d/%m/%Y")
                        #puts "Expiration date: #{expiration_date.strftime("%d/%m/%Y")}"

                    end

                    # If expired, add credit to the expiration table.
                    #if current_date == expiration_date
                        #Get credit details
                        #credit_details = CreditDetail.where(["excercise_year_id = ? AND credit_identifier = ? AND installment_payment <> ?", current_excercise, credit.identifier, "Première tranche"])
                        payment_timetables = PaymentTimetable.where(["excercise_year_id = ? AND credit_identifier = ?", current_excercise, credit.identifier.to_s])

                        if payment_timetables
                            payment_timetables.each do |payment_timetable|
                                payment_timetable_details = PaymentTimetableDetail.where(["payment_timetable_id = ? AND paid_by_bank = ? AND installment_payment <> ?",  payment_timetable.id,  "Oui",  "Première tranche"])
                                #puts "PAYMENT TIMETABLE DETAILS: #{payment_timetable_details.inspect}"
                                i = 0
                                payment_timetable_details.each do |payment_timetable_detail|
                                    
                                    #if  payment_timetable_detail.paid_by_bank == "Oui"

                                        monthly_payment_delay_expireds = MonthlyPaymentDelayExpired.where(["credit_identifier = ? AND excercise_year_id = ? AND target = ? AND installment = ?", credit.identifier, current_excercise, payment_timetable.target, payment_timetable_detail.installment_payment ])
                                        
                                        unless monthly_payment_delay_expireds.present?
                                            monthly_installment_delay_expired = MonthlyPaymentDelayExpired.new
                                            monthly_installment_delay_expired.installment = payment_timetable_detail.installment_payment
                                            monthly_installment_delay_expired.credit_identifier = payment_timetable.credit_identifier
                                            monthly_installment_delay_expired.expiration_date = expiration_date
                                            monthly_installment_delay_expired.target = payment_timetable.target
                                            monthly_installment_delay_expired.payment_amount = payment_timetable_detail.commission
                                            monthly_installment_delay_expired.excercise_year_id = current_excercise

                                            monthly_installment_delay_expired.user_id = credit.user_id
                                            
                                            if generate_bordereau?(credit, payment_timetable, payment_timetable_detail, current_excercise)

                                                monthly_installment_delay_expired.save
                                            end

                                            i+= 1
                                            
                                            puts "BORDERAU N°: #{i}"
                                            puts "PAYMENT TIMETABLE DETAILS: #{payment_timetable_detail.inspect}"

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