class DashboardController < ApplicationController
	
	before_action :authenticate_user!
	before_action :configure_options
	before_action :has_company
	layout 'dashboard'
	
	def index

		if current_user.present? && is_producer?(current_user)
			@commissions = Commission.where(producer_name: current_user.full_name)
		elsif current_user.present? && is_contributor?(current_user)
			@commissions = Commission.where(contributor_name: current_user.full_name)	
		elsif is_admin?
			@credits = current_user.credits

			@banks_count = current_user.banks.count if current_user.banks.present?
			@customers_count = current_user.customers.count if current_user.customers.present?
			@credits_count = current_user.credits.count if current_user.credits.present?

			contributors_count = User.find_by_role_and_creator('Apporteur', current_user.id).count if User.find_by_role_and_creator('Apporteur', current_user.id).present?
			producers_count = User.find_by_role_and_creator('Producteur', current_user.id).count if User.find_by_role_and_creator('Producteur', current_user.id).present?

			@producers_and_contributors_count = contributors_count.to_i + producers_count.to_i
		elsif is_superadmin?
			@credits = current_user.credits

			@banks_count = current_user.banks.count if current_user.banks.present?
			@customers_count = current_user.customers.count if current_user.customers.present?
			
			@credits_count = current_user.credits.count if current_user.credits.present?
	
			contributors_count = User.find_by_role_and_creator('Apporteur', current_user.id).count if User.find_by_role_and_creator('Apporteur', current_user.id).present?
			producers_count = User.find_by_role_and_creator('Producteur', current_user.id).count if User.find_by_role_and_creator('Producteur', current_user.id).present?
	
			@producers_and_contributors_count = contributors_count.to_i + producers_count.to_i
		end
	end

	def has_company
		if current_user.role == "Admin"  && current_user.company.blank?
			redirect_to new_company_path
		end
	end

	def configure_options
		config_options = ConfigOption.all

		unless config_options.present?
			redirect_to new_config_option_path
		end
	end

	
	#private
	#def complete_company
		#if current_user.superadmin? and current_user.company.blank?
			#redirect_to complete_company_path(current_user)
		#end
	#end

end