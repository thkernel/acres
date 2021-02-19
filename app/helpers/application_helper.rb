module ApplicationHelper
	include PaymentDelaysHelper
    include UsersHelper
    include CommissionsHelper
    include CreditsHelper
	include BanksHelper

    
	
	def devise_mapping
	    @devise_mapping ||= Devise.mappings[:user]
	end
	
	def my_logger
		@@my_logger ||= Logger.new("#{Rails.root}/log/commission-log.log")
	end

	def stats_logger
		@@stats_logger ||= Logger.new("#{Rails.root}/log/stats.log")
	end

	def commissions_search_logger
		@@commissions_search_logger ||= Logger.new("#{Rails.root}/log/commissions_search.log")
	end

	def monthly_credit_production_logger
		@@monthly_credit_production_logger ||= Logger.new("#{Rails.root}/log/monthly_credit_production.log")
	end

	def monthly_credit_acte_logger
		@@monthly_credit_acte_logger ||= Logger.new("#{Rails.root}/log/monthly_credit_acte.log")
	end

    def first_installment_payment_delay_expired?
        false
    end
	

	def unregistered_commission_percentage?
		
		users = User.find_user_by_role('Apporteur','Producteur' )
		status = false
		users.each do |user_id|
			
            user_commission_percentage = CommissionSetting.find_by(user_id: user_id)
            #user_commission_percentage = CommissionSetting.where(["user_id = ? AND excercise_year_id = ?",  user_id, current_excercise.id]).take


			if user_commission_percentage.present?
				status = false
			else
				status = true
			end
		end

		return status

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
		
        credit = Credit.find_by(identifier: credit_id)
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

	


	def commission_rate_to_use(bank_name)
		begin
            #bank = Bank.find_by(name: bank_name)
            bank = Bank.where(["name = ? AND excercise_year_id = ?", bank_name, current_excercise.id ]).take
			#bank_commission_rate_tracker = BankCommissionRateTracker.find_by(bank_id: bank.id) if bank.present?
			bank_commission_rate_tracker = BankCommissionRateTracker.where(["bank_id = ? AND excercise_year_id = ?",  bank.id, current_excercise.id]).take if bank.present?

			if bank_commission_rate_tracker.present?
				#last_bank_commission_rate = bank_commission_rate_tracker.last
				#last_bank_commission_rate.new_rate
				bank_commission_rate_tracker
			end
		rescue Exception => e
			puts "Erreur: #{e.message}"
		end
	end

	





























end
