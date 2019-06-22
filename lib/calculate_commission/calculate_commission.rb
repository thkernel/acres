module CalculateCommission

    def my_logger
		@@my_logger ||= Logger.new("#{Rails.root}/log/commission-log.log")
    end
    
    def is_cocourtier?(producer_name) 
		user =  User.find_user_by_name_and_role(producer_name, 'Co-courtier').first
		if user.present? 
			if user.role == 'Co-courtier'
				true 
			else
				false 
			end
		end
    end

    def credit_customer_name(credit_id)
		credit = Credit.find_by(credit_id: credit_id)
		if credit.present?
			credit.customer_name 
		end
	end
    
    def calculate_bank_commission_rate_evolution(enable_bank_commission_rate_changments)
        begin
            puts "Total enable in: #{enable_bank_commission_rate_changments.count}"
            # Get the system current date
            system_current_date = Time.now.strftime("%d/%m/%Y")

            puts "System current date: #{system_current_date}"

            if enable_bank_commission_rate_changments.present?

                enable_bank_commission_rate_changments.each do |record|
                    start_date = record.start_date.strftime("%d/%m/%Y")

                    puts "Date d'effet: #{start_date}"

                    if start_date == system_current_date
                    
                        bank = Bank.find(record.bank_id)

                        if bank.present? 
                            commissions = Commission.where(bank_name: bank.name.downcase).where("production_date is not null")
                            
                            if commissions.present? 

                                commissions.each do |commission|
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
                                    current_company =  Company.take
                                    if  current_company.present?
                                        company_name = current_company.name.downcase
                                    else
                                        return
                                    end

                                     #credit_hypoplus = get_credit_hypoplus(commission.credit_id).hypoplus
                                    credit_hypoplus = Credit.find_by(credit_id: commission.credit_id).hypoplus
                                    
                                    # Credit amount.
                                    if commission.amount_credit.present?
                                        credit_amount = commission.amount_credit 
                                    end
            

                                    production_date = commission.production_date

                                    if production_date.present? 
                                        if start_date < production_date 
                                         
                                            bank_commission_percentage = record.new_rate
                                    
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
                                            #commission.user_id = current_user.id
                                            commission.save
                                            
                                            puts "===============ENREGISTREMENT DANS BASE============================"


                                            record.update_attributes(status: "enable")
                                            puts "STATUS WAS UPDATED TO: #{record.status}"
                                        end


                                    end
                                end
                            end

                        end
                        
                        
                    else
                        puts "AUCUN CALCUL N'A ÉTÉ FAIT"
                    end

                   
                
                end

            end
        
        rescue Exception => e  
            puts "Erreur de calcul de commission: #{e.backtrace}"
            #logger.error("Message for the log file #{e.backtrace}")
            #my_logger.info("Message for the log file #{e.backtrace}")
			
        end

    end
end