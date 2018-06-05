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

	def admin_company_logo(user)
		admin = User.find_by(id: user.created_by)
		admin.company
	end
end
