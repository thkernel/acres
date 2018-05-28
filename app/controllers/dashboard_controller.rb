class DashboardController < ApplicationController
	before_action :authenticate_user!
	layout 'dashboard'
	
	def index
		if !current_user.superadmin_role? and current_user.company.blank?
			redirect_to complete_company_path(current_user)
		end
	end

	
	#private
	#def complete_company
		#if current_user.superadmin? and current_user.company.blank?
			#redirect_to complete_company_path(current_user)
		#end
	#end

end