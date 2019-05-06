module UsersHelper

	def resource_name
		:user
	end

	def resource
			@resource ||= User.new
	end

	def resource_class
		User
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
	
end