module ApplicationHelper

    def resource_name
	    :user
	end

	def resource
	    @resource ||= User.new
	end
	
	def resource_class
		User
	end
	
	def devise_mapping
	    @devise_mapping ||= Devise.mappings[:user]
	end
	
	def my_logger
		@@my_logger ||= Logger.new("#{Rails.root}/log/commission-log.log")
	end

	def is_admin?
		if  current_user.role == 'Admin'
			true
		else
			false
		end

	end

	def is_superadmin?
		if  current_user.role == 'Superadmin'
			true
		else
			false
		end

	end

	def is_manager?
		if  current_user.role == 'Manager'
			true
		else
			false
		end

	end

	def not_admin_or_superadmin?
		if  current_user.role != 'Admin' && current_user.role != 'Superadmin'
			true
		else
			false
		end

	end

	def not_admin_or_superadmin(user)
		if  user.role != 'Admin' && user.role != 'Superadmin'
			true
		else
			false
		end

	end


	def have_commission_settings?(user)
		if user.commission_setting.present?
			true
		else
			false
		end
	end

	def have_mail_settings?(user)
		if user.mail_configuration.present?
			true
		else
			false
		end
	end

	def is_producer?(user) 
		if user.present? 
			if user.role == 'Producteur'
				true 
			else
				false 
			end
		end
	end

	def is_contributor?(user) 
		if user.present? 
			if user.role == 'Apporteur'
				true 
			else
				false 
			end
		end
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

	def is_contributor_or_producer?(user) 
		if user.present? 
			if user.role == 'Apporteur' || user.role == 'Producteur'
				true 
			else
				false 
			end
		end
	end

	
	def get_bank_commission_rate(bank_name)
		bank = Bank.find_by(name: bank_name)
		bank.commission_percentage
	end
	def credit_acte_date(credit_id)
		credit = Credit.find_by(credit_id: credit_id)
		credit.acte_date if credit.acte_date.present?
	end

	def credit_customer_name(credit_id)
		credit = Credit.find_by(credit_id: credit_id)
		if credit.present?
			credit.customer_name 
		end
	end

	def unregistered_commission_percentage?
		
		users = User.find_user_by_role('Apporteur','Producteur' )
		status = false
		users.each do |user_id|
			
			user_commission_percentage = CommissionSetting.find_by(user_id: user_id)

			if user_commission_percentage.present?
				status = false
			else
				status = true
			end
		end

		return status

	end

	def is_main_admin?(user)
		
		super_admin = User.find_by(role: 'Superadmin')

		if user.created_by == super_admin.id
			return true
		else
			return false
		end
	end

	def get_main_admin(user)
		
		if is_main_admin?(user)
			return user
		else
			main_admin = User.find_by(id: user.created_by)
		end
	end

	def get_app_name(user)
		if is_main_admin?(user)
			user_app_config = user.app_config  
			if user_app_config.present?
				app_name = user_app_config.name
			end
		elsif is_superadmin?
			app_name = "COSMOPOL"
		else
			main_admin = User.find_by(id: user.created_by)
			user_app_config = main_admin.app_config 
			if user_app_config.present?
				app_name = user_app_config.name
			end
		end
	end

	def current_company
	
		company = Company.take
		if company.present?
			company
		end
		
	end


	def get_admin_company(user)
		if is_main_admin?(user)
			user_app_company = user.company 
			if user_app_company.present?
				company = user_app_company
			end
		else
			
			main_admin = User.find_by(id: user.created_by)

			if main_admin.present?
				user_app_company = main_admin.company
				 
				if user_app_company.present?
					company = user_app_company
				end
			end
			
		end
	end

	def is_account_locked?(user)
		if user.status == 'enable'
			false
		else
			true
		end
	end

	def is_app_name_exist?(user)
		app_name = get_app_name(user)
		if app_name.present?
			true
		else
			false
		end
	end

	def bank_name(id)
		bank = Bank.find(id)
		bank.name
	end

	def completed?(status)
		if status == 'yes'
			true
		else
			false
		end
	end

	def current_company
		company = Company.first
	end

	def get_credit_hypoplus(credit_id)
		
		credit = Credit.find_by(credit_id: credit_id)
		credit.hypoplus
		
	end

	def get_account_status?(subdomain)
		account = Account.find_by(subdomain: subdomain)

		if account.present? && account.status == true
			true 
		else
			false
		end
	end

	def get_customer_name(credit_id)
		credit = Credit.find(credit_id)
		
		credit.customer_name  if credit
	end


	# Handle commissions.
	def handle_commissions

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

			#credit_hypoplus = get_credit_hypoplus(commission.credit_id).hypoplus
			credit_hypoplus = get_credit_hypoplus(commission.credit_id)
            
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
					puts "REGLE 4"
					
					
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



	def calculate_abandonment_commission(bank_name, credit_id, new_commission_rate)
		bank = Bank.find_by(name: bank_name)
		old_commission_rate = bank.commission_percentage
		commission = Commission.find_by(credit_id: credit_id)

		contributor_name = commission.contributor_name.downcase 
		producer_name = commission.producer_name.downcase 
		company_name = current_company.name.downcase
		amount_credit = commission.amount_credit
		company_commission_net = 0.0
		producer_commission = 0.0
		contributor_commission = commission.contributor_commission

		if producer_name.present? && producer_name == company_name 
			commission_diff = (amount_credit) * ((new_commission_rate)/100)
			bank_commission = commission_diff
			company_commission_net = ((old_commission_rate) / 100) - ((100 * commission_diff)/100)
		end

		if producer_name.present? && producer_name != company_name 
			commission_diff = (amount_credit) * (new_commission_rate)/100
			producer_commission = contributor_commission - ((50 * commission_diff)/100)
			bank_commission = commission_diff
			company_commission_net = ((old_commission_rate) / 100) - producer_commission - contributor_commission - ((50 * commission_diff)/100)
		end

		commission.update_column(company_commission_net: company_commission_net)
		commission.update_column(producer_commission: producer_commission)

	end
end
