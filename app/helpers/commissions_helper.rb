module CommissionsHelper

    def bank_commission_rate_changed?(bank_name)
		begin
			bank = Bank.where(["name = ? AND excercise_year_id = ?",  bank_name, current_excercise.id]).take
			bank_commission_rate_tracker = BankCommissionRateTracker.where(["bank_id = ? AND excercise_year_id =  ?", bank.id, current_excercise.id]) if bank.present?

			if bank_commission_rate_tracker.present? && bank_commission_rate_tracker.count > 1
				true
			else
				false
			end
		rescue Exception => e
			puts "Erreur: #{e.message}"
		end
	end



    # Calculate bank commission rate change.

    def calculate_bank_commission_rate_changment
        # Si la date d'effet
        production_date = commission.production_date
        commission_rate_start_date = commission_rate_to_use(bank.name.downcase).start_date

        if production_date.present? && commission_rate_start_date.present?
            if commission_rate_start_date > production_date 
                bank_commission_percentage = commission_rate_to_use(bank.name.downcase).old_rate
            else
                bank_commission_percentage = commission_rate_to_use(bank.name.downcase).new_rate

            end

            if bank.present? && bank.hypoplus_commission_percentage.present?
                bank_hypoplus_commission_percentage = bank.hypoplus_commission_percentage 
            end

        
            # Get contributor.
            if  commission.contributor_name.present?
                contributor_name = commission.contributor_name.downcase
                contributor = User.find_user_by_name_and_role(contributor_name, 'Apporteur').first
                    if contributor.present? && contributor.commission_setting.present?
                        contributor_commission_percentage = contributor.commission_setting.commission_percentage 
                        contributor_hypoplus_commission_percentage = contributor.commission_setting.hypoplus_commission_percentage 
                        
                    end
                puts "Apporteur: #{contributor_name} et #{contributor_commission_percentage}"
            end
                
            # Get producer.
            if commission.producer_name.present?
                producer_name = commission.producer_name.downcase

                producer = User.find_user_by_name_and_role(producer_name, 'Producteur').first
        
                if producer.present? && producer.commission_setting.present? 
                    producer_commission_percentage = producer.commission_setting.commission_percentage 
                    producer_hypoplus_commission_percentage = producer.commission_setting.hypoplus_commission_percentage 
                
                end
                puts "Producteur: #{producer_name} et #{producer_commission_percentage}"
            end

        

            # Handle 
            if credit_hypoplus.present? 
                puts "CALCUL HYPOPLUS POUR NO:#{commission.credit_id} Montant: #{commission.amount_credit}"
                puts "Banque HYPO: #{bank_hypoplus_commission_percentage}"
                my_logger.info("======Calcul d'Hypoplys====")
                my_logger.info("Dossier: #{commission.credit_id}, Banque: #{commission.bank_name}, Client: #{credit_customer_name(commission.customer_id) if commission.customer_id}, Montant #{commission.amount_credit}")
                

                if bank_hypoplus_commission_percentage.present? && bank_hypoplus_commission_percentage > 0.0 
                            
                    if producer_name.present? &&  producer_name != company_name 
                        contributor_commission_percentage = 0.0 
                        contributor_commission = 0.0

                    
                        bank_amount_commission = (credit_amount * bank_hypoplus_commission_percentage) / 100
                        producer_commission = (bank_amount_commission) / 2

                        producer_commission_percentage = (bank_hypoplus_commission_percentage ) / 2

                        company_commission_net = (bank_amount_commission) / 2
                        company_commission_percentage = (company_commission_net / credit_amount) * 100
                        my_logger.info("====== Commission apres calcul ====")
                        my_logger.info("Commission banque: #{bank_amount_commission}, Commission producteur: #{producer_commission}, commission net acres: #{company_commission_net}")
                        my_logger.info("====== FIN CALCUL ====")


                    else
                        contributor_commission_percentage = 0.0 
                        contributor_commission = 0.0

                        producer_commission = 0.0
                        producer_commission_percentage = 0.0 

                        
                        bank_amount_commission = (credit_amount * bank_hypoplus_commission_percentage) / 100
                    

                        company_commission_net = bank_amount_commission
                        company_commission_percentage = (company_commission_net / credit_amount) * 100
                        my_logger.info("====== Commission apres calcul ====")
                        my_logger.info("Commission banque: #{bank_amount_commission},  commission net acres: #{company_commission_net}")
                        my_logger.info("====== FIN CALCUL ====")
                    end

                end
            else
        
                # Rule 1
                if contributor_name == company_name && producer_name == company_name 
                
                    if is_cocourtier?(producer_name)
                        contributor_commission_percentage = 0.0 
                        contributor_commission = 0.0

                        producer_commission_percentage = 0.0
                        producer_commission = 0.0

                        producer_commission = credit_amount * (bank_amount_commission - bank.company_remaining_commission_rate) 
                        bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
                        company_commission_net = (bank_amount_commission) - (producer_commission)
                        company_commission_percentage = (company_commission_net / credit_amount) * 100

                    else
                        contributor_commission_percentage = 0.0 
                        contributor_commission = 0.0

                        producer_commission_percentage = 0.0
                        producer_commission = 0.0

                        bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
                        company_commission_net = bank_amount_commission
                        company_commission_percentage = (company_commission_net / credit_amount) * 100

                        puts "REGLE 1"
                    end
                end

                # Rule 1 bis
                if contributor_name.blank? && producer_name == company_name 
                
                    if is_cocourtier?(producer_name)
                        contributor_commission_percentage = 0.0 
                        contributor_commission = 0.0

                        producer_commission_percentage = 0.0
                        producer_commission = 0.0

                        producer_commission = credit_amount * (bank_amount_commission - bank.company_remaining_commission_rate) 
                        bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
                        company_commission_net = (bank_amount_commission) - (producer_commission)
                        company_commission_percentage = (company_commission_net / credit_amount) * 100
                    else
                        contributor_commission_percentage = 0.0 
                        producer_commission_percentage = 0.0
                        
                        contributor_commission = 0.0
                        producer_commission = 0.0

                        bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
                        company_commission_net = bank_amount_commission
                        company_commission_percentage = (company_commission_net / credit_amount) * 100

                    end
                end

                # Rule 2 - new regle
                if contributor_name.present? &&  contributor_name != company_name && producer_name == company_name
                    if is_cocourtier?(producer_name)
                        contributor_commission_percentage = 0.0 
                        contributor_commission = 0.0

                        producer_commission_percentage = 0.0
                        producer_commission = 0.0

                        producer_commission = credit_amount * (bank_amount_commission - bank.company_remaining_commission_rate) 
                        bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
                        company_commission_net = (bank_amount_commission) - (producer_commission)
                        company_commission_percentage = (company_commission_net / credit_amount) * 100
                    else
                        producer_commission = 0.0
                        producer_commission_percentage = 0.0

                        bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
                        contributor_commission = (credit_amount * contributor_commission_percentage) / 100
                        company_commission_net = (bank_amount_commission) - (contributor_commission)
                        company_commission_percentage = (company_commission_net / credit_amount) * 100

                    end
                
                end
            

                # Regle 3 - new
                if contributor_name.present? && contributor_name == producer_name && producer_name != company_name
                    if is_cocourtier?(producer_name)
                        contributor_commission_percentage = 0.0 
                        contributor_commission = 0.0

                        producer_commission_percentage = 0.0
                        producer_commission = 0.0

                        producer_commission = credit_amount * (bank_amount_commission - bank.company_remaining_commission_rate) 
                        bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
                        company_commission_net = (bank_amount_commission) - (producer_commission)
                        company_commission_percentage = (company_commission_net / credit_amount) * 100
                    else
                        contributor_commission = 0.0
                        contributor_commission_percentage = 0.0 

                        producer_commission = (credit_amount * producer_commission_percentage) / 100
                        bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
                        company_commission_net = (bank_amount_commission) - (producer_commission)
                        company_commission_percentage = (company_commission_net / credit_amount) * 100
                    end

                end


                # Regle 4 - New
                if contributor_name.present? && contributor_name != producer_name && contributor_name != company_name && producer_name != company_name
                    if is_cocourtier?(producer_name)
                        contributor_commission_percentage = 0.0 
                        contributor_commission = 0.0

                        producer_commission_percentage = 0.0
                        producer_commission = 0.0

                        producer_commission = credit_amount * (bank_amount_commission - bank.company_remaining_commission_rate) 
                        bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
                        company_commission_net = (bank_amount_commission) - (producer_commission)
                        company_commission_percentage = (company_commission_net / credit_amount) * 100
                        
                    else
                    
                        bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
                        contributor_commission = (credit_amount * contributor_commission_percentage) / 100
                        producer_commission = ((credit_amount * producer_commission_percentage) / 100) - ((contributor_commission * 50)/100)
                        company_commission_net = (bank_amount_commission) - (producer_commission) - (contributor_commission)
                        company_commission_percentage = (company_commission_net / credit_amount) * 100
                    end
                    
                    
                end
            
            
                # Regle 5
                if contributor_name.present? && contributor_name == company_name && producer_name != company_name 
                    if is_cocourtier?(producer_name)
                        contributor_commission_percentage = 0.0 
                        contributor_commission = 0.0

                        producer_commission_percentage = 0.0
                        producer_commission = 0.0

                        producer_commission = credit_amount * (bank_amount_commission - bank.company_remaining_commission_rate) 
                        bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
                        company_commission_net = (bank_amount_commission) - (producer_commission)
                        company_commission_percentage = (company_commission_net / credit_amount) * 100
                    else
                        contributor_commission = 0.0
                        contributor_commission_percentage = 0.0

                        bank_amount_commission = (credit_amount * bank_commission_percentage) / 100

                        producer_commission = ((credit_amount * producer_commission_percentage) / 100) 
                        company_commission_net = (bank_amount_commission) - (producer_commission) 
                        company_commission_percentage = (company_commission_net / credit_amount) * 100
                    end
                    puts "REGLE 5"
                end
                
                
            end
        
            # Saving.
            commission.customer_id = contributor_commission
            commission.contributor_commission = contributor_commission
            commission.contributor_commission_percentage = contributor_commission_percentage
            commission.producer_commission = producer_commission
            commission.producer_commission_percentage = producer_commission_percentage
            commission.bank_commission = bank_amount_commission
            commission.bank_commission_percentage = bank_commission_percentage
            commission.company_commission = company_commission_net
            commission.company_commission_percentage = company_commission_percentage
            commission.user_id = current_user.id
            commission.save
            
            puts "===============ENREGISTREMENT DANS BASE============================"


        end


    end

   



    # Handle commissions.
	def new_calculate_commissions(*args)
        begin
            # Initialize
            producer_commission_percentage = 0.0
            contributor_commission_percentage = 0.0
            bank_commission_percentage = 0.0
            company_commission_percentage = 0.0
            credit_amount = 0.0
            company_commission_net = 0.0
            producer_commission = 0.0
            contributor_commission = 0.0
            bank_amount_commission = 0.0
            bank_hypoplus_commission_percentage = 0.0
            contributor_hypoplus_commission_percentage = 0.0
            producer_hypoplus_commission_percentage = 0.0

            # Getting company infos.
            if  current_company.present?
                company_name = current_company.name.downcase
            else
                return
            end
            
            @commissions = nil

            if args.present? && args.count > 0
                if args[0][:key] == "user"
                    commission_type = "user"
                    user = User.find(args[0][:value])

                    if user.role == "Apporteur"
                        @commissions = Commission.where(["contributor_name = ? AND excercise_year_id = ?", user.full_name, current_excercise.id])
                    elsif user.role == "Producteur"
                        @commissions = Commission.where(["producer_name = ? AND excercise_year_id = ?", user.full_name, current_excercise.id])
                    end
                elsif args[0][:key] == "bank"
                    commission_type = "bank"
                    bank = Bank.find(args[0][:value])
                    @commissions = Commission.where(["bank_name = ? AND excercise_year_id = ?",  bank.name, current_excercise.id])
                end
            else
                # Load all commissions.
                @commissions = Commission.where(excercise_year_id: current_excercise.id)
            end

            if @commissions.present?
                # For each commissions
                @commissions.each do |commission|

                    # Get hypoplus column.

                    #credit_hypoplus = get_credit_hypoplus(commission.credit_id).hypoplus
                    credit_hypoplus = get_credit_hypoplus(commission.credit_id)
                    
                    # Credit amount.
                    if commission.amount_credit.present?
                        credit_amount = commission.amount_credit 
                    end

                    # We get the bank infos.
                    if commission.bank_name
                        #bank = Bank.find_by_name(commission.bank_name)
                        bank = Bank.where(["name = ? AND excercise_year_id = ?", commission.bank_name, current_excercise.id]).take
                    end
                    

                    # If bank commission rate was changed.
                    

                        if bank.present? && bank.commission_percentage.present?
                            puts "BANQUE NAME: #{bank.name} et #{bank.commission_percentage}"
                            # Get bank infos required infos for the compute.
                            bank_commission_percentage = bank.commission_percentage 
                        end

                        if bank.present? && bank.hypoplus_commission_percentage.present?
                            bank_hypoplus_commission_percentage = bank.hypoplus_commission_percentage 
                        end

                        # We get the producer infos.
                       
                
                        # Get contributor.
                        if commission.contributor_name.present?
                            contributor_name = commission.contributor_name.downcase
                            contributor = User.find_user_by_name_and_role(contributor_name, 'Apporteur').first
                                if contributor.present? && contributor.commission_setting.present?
                                    contributor_commission_percentage = contributor.commission_setting.commission_percentage 
                                    contributor_hypoplus_commission_percentage = contributor.commission_setting.hypoplus_commission_percentage 
                                    
                                end
                            puts "Apporteur: #{contributor_name} et #{contributor_commission_percentage}"
                        end
                            
                        # Get producer.
                        if commission.producer_name.present?
                            producer_name = commission.producer_name.downcase

                            producer = User.find_user_by_name_and_role(producer_name, 'Producteur').first
                    
                            if producer.present? && producer.commission_setting.present? 
                                producer_commission_percentage = producer.commission_setting.commission_percentage 
                                producer_hypoplus_commission_percentage = producer.commission_setting.hypoplus_commission_percentage 
                            
                            end
                            puts "Producteur: #{producer_name} et #{producer_commission_percentage}"
                        end

                    

                        # Handle 
                        if credit_hypoplus.present? 
                            puts "CALCUL HYPOPLUS POUR NO:#{commission.credit_id} Montant: #{commission.amount_credit}"
                            puts "Banque HYPO: #{bank_hypoplus_commission_percentage}"
                            my_logger.info("======Calcul d'Hypoplys====")
                            my_logger.info("Dossier: #{commission.credit_id}, Banque: #{commission.bank_name}, Client: #{credit_customer_name(commission.customer_id) if commission.customer_id}, Montant #{commission.amount_credit}")
                            

                            if bank_hypoplus_commission_percentage.present? && bank_hypoplus_commission_percentage > 0.0 
                                        
                                if producer_name.present? &&  producer_name != company_name 
                                    contributor_commission_percentage = 0.0 
                                    contributor_commission = 0.0

                                
                                    bank_amount_commission = (credit_amount * bank_hypoplus_commission_percentage) / 100
                                    producer_commission = (bank_amount_commission) / 2

                                    producer_commission_percentage = (bank_hypoplus_commission_percentage ) / 2

                                    company_commission_net = (bank_amount_commission) / 2
                                    company_commission_percentage = (company_commission_net / credit_amount) * 100
                                    my_logger.info("====== Commission apres calcul ====")
                                    my_logger.info("Commission banque: #{bank_amount_commission}, Commission producteur: #{producer_commission}, commission net acres: #{company_commission_net}")
                                    my_logger.info("====== FIN CALCUL ====")


                                else
                                    contributor_commission_percentage = 0.0 
                                    contributor_commission = 0.0

                                    producer_commission = 0.0
                                    producer_commission_percentage = 0.0 

                                    
                                    bank_amount_commission = (credit_amount * bank_hypoplus_commission_percentage) / 100
                                

                                    company_commission_net = bank_amount_commission
                                    company_commission_percentage = (company_commission_net / credit_amount) * 100
                                    my_logger.info("====== Commission apres calcul ====")
                                    my_logger.info("Commission banque: #{bank_amount_commission},  commission net acres: #{company_commission_net}")
                                    my_logger.info("====== FIN CALCUL ====")
                                end

                            end
                        else
                    
                            # Rule 1
                            if contributor_name == company_name && producer_name == company_name 
                            
                                if is_cocourtier?(producer_name)
                                    contributor_commission_percentage = 0.0 
                                    contributor_commission = 0.0

                                    producer_commission_percentage = 0.0
                                    producer_commission = 0.0

                                    producer_commission = (credit_amount * (bank_amount_commission - bank.company_remaining_commission_rate))/100
                                    bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
                                    company_commission_net = (bank_amount_commission) - (producer_commission)
                                    company_commission_percentage = (company_commission_net / credit_amount) * 100

                                else
                                    contributor_commission_percentage = 0.0 
                                    contributor_commission = 0.0

                                    producer_commission_percentage = 0.0
                                    producer_commission = 0.0

                                    bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
                                    company_commission_net = bank_amount_commission
                                    company_commission_percentage = (company_commission_net / credit_amount) * 100

                                    puts "REGLE 1"
                                end
                            end

                            # Rule 1 bis
                            if contributor_name.blank? && producer_name == company_name 
                            
                                if is_cocourtier?(producer_name)
                                    contributor_commission_percentage = 0.0 
                                    contributor_commission = 0.0

                                    producer_commission_percentage = 0.0
                                    producer_commission = 0.0

                                    producer_commission = (credit_amount * (bank_amount_commission - bank.company_remaining_commission_rate) )/ 100
                                    bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
                                    company_commission_net = (bank_amount_commission) - (producer_commission)
                                    company_commission_percentage = (company_commission_net / credit_amount) * 100
                                else
                                    contributor_commission_percentage = 0.0 
                                    producer_commission_percentage = 0.0
                                    
                                    contributor_commission = 0.0
                                    producer_commission = 0.0

                                    bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
                                    company_commission_net = bank_amount_commission
                                    company_commission_percentage = (company_commission_net / credit_amount) * 100

                                    puts "REGLE 1 BIS"
                                end
                            end

                            # Rule 2 - new regle
                            if contributor_name.present? &&  contributor_name != company_name && producer_name == company_name
                                if is_cocourtier?(producer_name)
                                    contributor_commission_percentage = 0.0 
                                    contributor_commission = 0.0

                                    producer_commission_percentage = 0.0
                                    producer_commission = 0.0

                                    producer_commission = (credit_amount * (bank_amount_commission - bank.company_remaining_commission_rate) )/100
                                    bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
                                    company_commission_net = (bank_amount_commission) - (producer_commission)
                                    company_commission_percentage = (company_commission_net / credit_amount) * 100
                                else
                                    producer_commission = 0.0
                                    producer_commission_percentage = 0.0

                                    bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
                                    contributor_commission = (credit_amount * contributor_commission_percentage) / 100
                                    company_commission_net = (bank_amount_commission) - (contributor_commission)
                                    company_commission_percentage = (company_commission_net / credit_amount) * 100
                                    puts "REGLE 2"

                                end
                            
                            end
                        

                            # Regle 3 - new
                            if contributor_name.present? && contributor_name == producer_name && producer_name != company_name
                                if is_cocourtier?(producer_name)
                                    contributor_commission_percentage = 0.0 
                                    contributor_commission = 0.0

                                    producer_commission_percentage = 0.0
                                    producer_commission = 0.0

                                    producer_commission = (credit_amount * (bank_amount_commission - bank.company_remaining_commission_rate) )/100
                                    bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
                                    company_commission_net = (bank_amount_commission) - (producer_commission)
                                    company_commission_percentage = (company_commission_net / credit_amount) * 100
                                else
                                    contributor_commission = 0.0
                                    contributor_commission_percentage = 0.0 

                                    producer_commission = (credit_amount * producer_commission_percentage) / 100
                                    bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
                                    company_commission_net = (bank_amount_commission) - (producer_commission)
                                    company_commission_percentage = (company_commission_net / credit_amount) * 100
                                    puts "REGLE 3"
                                end

                            end


                            # Regle 4 - New
                            if contributor_name.present? && contributor_name != producer_name && contributor_name != company_name && producer_name != company_name
                                if is_cocourtier?(producer_name)
                                    contributor_commission_percentage = 0.0 
                                    contributor_commission = 0.0

                                    producer_commission_percentage = 0.0
                                    producer_commission = 0.0

                                    producer_commission = (credit_amount * (bank_amount_commission - bank.company_remaining_commission_rate) )/100
                                    bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
                                    company_commission_net = (bank_amount_commission) - (producer_commission)
                                    company_commission_percentage = (company_commission_net / credit_amount) * 100
                                    
                                else
                                
                                    bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
                                    contributor_commission = (credit_amount * contributor_commission_percentage) / 100
                                    producer_commission = ((credit_amount * producer_commission_percentage) / 100) - ((contributor_commission * 50)/100)
                                    company_commission_net = (bank_amount_commission) - (producer_commission) - (contributor_commission)
                                    company_commission_percentage = (company_commission_net / credit_amount) * 100
                                end
                                puts "REGLE 4"
                                
                                
                            end
                        
                        
                            # Regle 5
                            if contributor_name.present? && contributor_name == company_name && producer_name != company_name 
                                if is_cocourtier?(producer_name)
                                    contributor_commission_percentage = 0.0 
                                    contributor_commission = 0.0

                                    producer_commission_percentage = 0.0
                                    producer_commission = 0.0

                                    producer_commission = (credit_amount * (bank_amount_commission - bank.company_remaining_commission_rate) )/100
                                    bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
                                    company_commission_net = (bank_amount_commission) - (producer_commission)
                                    company_commission_percentage = (company_commission_net / credit_amount) * 100
                                else
                                    contributor_commission = 0.0
                                    contributor_commission_percentage = 0.0

                                    bank_amount_commission = (credit_amount * bank_commission_percentage) / 100

                                    producer_commission = ((credit_amount * producer_commission_percentage) / 100) 
                                    company_commission_net = (bank_amount_commission) - (producer_commission) 
                                    company_commission_percentage = (company_commission_net / credit_amount) * 100
                                end
                                puts "REGLE 5"
                            end
                            
                            
                        end
                    
                        # Saving.
                        commission.customer_id = contributor_commission
                        commission.contributor_commission = contributor_commission
                        commission.contributor_commission_percentage = contributor_commission_percentage
                        commission.producer_commission = producer_commission
                        commission.producer_commission_percentage = producer_commission_percentage
                        commission.bank_commission = bank_amount_commission
                        commission.bank_commission_percentage = bank_commission_percentage
                        commission.company_commission = company_commission_net
                        commission.company_commission_percentage = company_commission_percentage
                        commission.user_id = current_user.id
                        commission.save
                        
                        puts "===============ENREGISTREMENT DANS BASE============================"
                    
                end
            end
        rescue Exception => e  
            puts "Erreur de calcul de commission: #{e.message}"
            logger.error("Message for the log file #{e.backtrace}")
            my_logger.info("Message for the log file #{e.backtrace}")
			flash[:alert] = "Une erreur s'est passée: #{e.to_s}"
        end
	end
end
