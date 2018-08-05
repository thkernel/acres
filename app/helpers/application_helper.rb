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

	def admin_company_logo(user)
		admin = User.find_by(id: user.created_by)
		admin.company
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

	def is_main_admin?(user)
	end

	def credit_acte_date(credit_id)
		credit = Credit.find_by(credit_id: credit_id)
		credit.acte_date if credit.acte_date.present?
	end

	def credit_customer_name(credit_id)
		credit = Credit.find_by(credit_id: credit_id)
		credit.customer_name
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
end
