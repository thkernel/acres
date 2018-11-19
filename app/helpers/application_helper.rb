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

	def is_contributor_or_producer?(user) 
		if user.present? 
			if user.role == 'Apporteur' || user.role == 'Producteur'
				true 
			else
				false 
			end
		end
	end

	

	def credit_acte_date(credit_id)
		credit = Credit.find_by(credit_id: credit_id)
		credit.acte_date if credit.acte_date.present?
	end

	def credit_customer_name(credit_id)
		credit = Credit.find_by(credit_id: credit_id)
		credit.customer_name if credit.present?
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

	def get_app_logo(user)
		if is_main_admin?(user)
			user_app_company = user.app_config.company 
			if user_app_company.present?
				app_logo = user_app_company.brand
			end
		else
			main_admin = User.find_by(id: user.created_by)
			user_app_company = main_admin.app_config.company 
			if user_app_company.present?
				app_logo = user_app_company.brand
			end
		end
	end


	def get_admin_company(user)
		if is_main_admin?(user)
			user_app_company = user.app_config.company 
			if user_app_company.present?
				company = user_app_company
			end
		else
			if false
				main_admin = User.find_by(id: user.created_by)
				user_app_company = main_admin.app_config.company if main_admin.app_config.present?
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
end
