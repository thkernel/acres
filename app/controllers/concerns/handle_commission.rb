module HandleCommission
    include ActiveSupport::Concern

    
    def self.current_company
		company = Company.first
    end

    def self.get_credit_hypoplus(credit_id)
		
		credit = Credit.find_by(credit_id: credit_id)
		return credit
		
	end
    
    # Handle commissions.
	def self.handle_commissions

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
        end
        

		# Load all commissions.
		commissions = Commission.all

		# For each commissions
		commissions.each do |commission|

            # Get hypoplus column.

            credit_hypoplus = get_credit_hypoplus(commission.credit_id).hypoplus
            
			# Credit amount.
			if commission.amount_credit.present?
				credit_amount = commission.amount_credit 
			end

			# We get the bank infos.
			if commission.bank_name
				bank = Bank.find_by_name(commission.bank_name)
            end
            
			if bank.present? && bank.commission_percentage.present?
				puts "BANQUE NAME: #{bank.name} et #{bank.commission_percentage}"
				# Get bank infos required infos for the compute.
				bank_commission_percentage = bank.commission_percentage 
			end

			if bank.present? && bank.hypoplus_commission_percentage.present?
				bank_hypoplus_commission_percentage = bank.hypoplus_commission_percentage 
			end

			# We get the producer infos.
			contributor_name = commission.contributor_name.downcase
			producer_name = commission.producer_name.downcase
		
			# Get contributor.
			if contributor_name.present?
				contributor = User.find_user_by_name_and_role(contributor_name, 'Apporteur').first
					if contributor.present? && contributor.commission_setting.present?
						contributor_commission_percentage = contributor.commission_setting.commission_percentage 
						contributor_hypoplus_commission_percentage = contributor.commission_setting.hypoplus_commission_percentage 
						
					end
				puts "Apporteur: #{contributor_name} et #{contributor_commission_percentage}"
			end
					
			# Get producer.
			if producer_name.present?
				producer = User.find_user_by_name_and_role(producer_name, 'Producteur').first
		
				if producer.present? && producer.commission_setting.present? 
					producer_commission_percentage = producer.commission_setting.commission_percentage 
					producer_hypoplus_commission_percentage = producer.commission_setting.hypoplus_commission_percentage 
				
				end
				puts "Producteur: #{producer_name} et #{producer_commission_percentage}"
			end

			# Handle 
			if credit_hypoplus.present? 
				if bank_hypoplus_commission_percentage.present? && bank_hypoplus_commission_percentage > 0.0 
						
					if producer_name.present? &&  producer_name != company_name 
                        contributor_commission_percentage = 0.0 
                        contributor_commission = 0.0

                
                        bank_amount_commission = (credit_amount * bank_hypoplus_commission_percentage) / 100
                        producer_commission = (bank_amount_commission) / 2

                        company_commission_net = (bank_amount_commission) / 2
                        company_commission_percentage = (company_commission_net / credit_amount) * 100


                    else
                        contributor_commission_percentage = 0.0 
                        contributor_commission = 0.0

                        producer_commission = 0.0
                        producer_commission_percentage = 0.0 

                        
                        bank_amount_commission = (credit_amount * bank_hypoplus_commission_percentage) / 100
                       

                        company_commission_net = bank_amount_commission
                        company_commission_percentage = (company_commission_net / credit_amount) * 100
                
                    end

			    end
		    else
		
                # Rule 1
                if contributor_name == company_name && producer_name == company_name 
                
                    contributor_commission_percentage = 0.0 
                    producer_commission_percentage = 0.0
                    
                    contributor_commission = 0.0
                    producer_commission = 0.0

                    bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
                    company_commission_net = bank_amount_commission
                    company_commission_percentage = (company_commission_net / credit_amount) * 100

                    puts "REGLE 1"
                end

                # Rule 1 bis
                if contributor_name.blank? && producer_name == company_name 
                
                    contributor_commission_percentage = 0.0 
                    producer_commission_percentage = 0.0
                    
                    contributor_commission = 0.0
                    producer_commission = 0.0

                    bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
                    company_commission_net = bank_amount_commission
                    company_commission_percentage = (company_commission_net / credit_amount) * 100

                    puts "REGLE 1 BIS"
                end

                # Rule 2 - new regle
                if contributor_name.present? &&  contributor_name != company_name && producer_name == company_name
                    
                    producer_commission = 0.0
                    producer_commission_percentage = 0.0

                    bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
                    contributor_commission = (credit_amount * contributor_commission_percentage) / 100
                    company_commission_net = (bank_amount_commission) - (contributor_commission)
                    company_commission_percentage = (company_commission_net / credit_amount) * 100
                    puts "REGLE 2"

                
                
                end
			

				# Regle 3 - new
                if contributor_name.present? && contributor_name == producer_name && producer_name != company_name
                    contributor_commission = 0.0
                    contributor_commission_percentage = 0.0 

                    producer_commission = (credit_amount * producer_commission_percentage) / 100
                    bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
                    company_commission_net = (bank_amount_commission) - (producer_commission)
                    company_commission_percentage = (company_commission_net / credit_amount) * 100
                    puts "REGLE 3"

                end


                # Regle 4 - New
                if contributor_name.present? && contributor_name != producer_name && contributor_name != company_name && producer_name != company_name
                    bank_amount_commission = (credit_amount * bank_commission_percentage) / 100
                    contributor_commission = (credit_amount * contributor_commission_percentage) / 100
                    producer_commission = ((credit_amount * producer_commission_percentage) / 100) - ((contributor_commission * 50)/100)
                    company_commission_net = (bank_amount_commission) - (producer_commission) - (contributor_commission)
                    company_commission_percentage = (company_commission_net / credit_amount) * 100

                    puts "REGLE 4"
                end
			
			
                # Regle 5
                if contributor_name.present? && contributor_name == company_name && producer_name != company_name 
                    contributor_commission = 0.0
                    contributor_commission_percentage = 0.0

                    bank_amount_commission = (credit_amount * bank_commission_percentage) / 100

                    producer_commission = ((credit_amount * producer_commission_percentage) / 100) 
                    company_commission_net = (bank_amount_commission) - (producer_commission) 
                    company_commission_percentage = (company_commission_net / credit_amount) * 100

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
	    end
	
	end
		
	
	
end