class DashboardController < ApplicationController
	
	before_action :authenticate_user!
	before_action :create_company

	layout 'dashboard'
	
	def index
		if is_manager?
			@accounts = Account.all
		end

		if current_user.status == 'enable'
			if current_user.present? && is_producer?(current_user)
				@producer_name = current_user.full_name
				@commissions = Commission.where(producer_name: current_user.full_name)
			elsif current_user.present? && is_contributor?(current_user)
				@contributor_name = current_user.full_name
				@commissions = Commission.where(contributor_name: current_user.full_name)	
			elsif is_admin?
				@credits = get_main_admin(current_user).credits

				@banks_count = get_main_admin(current_user).banks.count if get_main_admin(current_user).banks.present?
				@customers_count = get_main_admin(current_user).customers.count if get_main_admin(current_user).customers.present?
				@credits_count = get_main_admin(current_user).credits.count if get_main_admin(current_user).credits.present?

				contributors_count = User.find_by_role_and_creator('Apporteur', get_main_admin(current_user)).count if User.find_by_role_and_creator('Apporteur', get_main_admin(current_user)).present?
				producers_count = User.find_by_role_and_creator('Producteur', get_main_admin(current_user)).count if User.find_by_role_and_creator('Producteur', get_main_admin(current_user)).present?

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
		else
			redirect_to unauthorize_path
		end

		
	end

	def unauthorize
		render layout: 'unauthorize'
	end

	def create_company
		if current_user.role == "Admin"  && current_user.company.blank?
			redirect_to new_company_path
		end
	end

	def app_config
		if current_user.role == "Admin"  && current_user.app_config.blank? && is_main_admin?(current_user)
			redirect_to app_setup_path
			
		end
		#if is_main_admin?(current_user) && current_user.role == "Admin"

		#end
	end

	def configure_options
		config_options = ConfigOption.all

		unless config_options.present?
			redirect_to new_config_option_path
		end
	end

	

	
	

end