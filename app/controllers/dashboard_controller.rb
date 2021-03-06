class DashboardController < ApplicationController
	
	before_action :authenticate_user!
	before_action :create_company
	#before_action :if_excercise_year
	#before_action :load_session
	before_action :current_excercise_year


	layout 'dashboard'
	
	def index

		if is_manager?
			@accounts = Account.all
			
		end

		if current_user.status == 'enable'
			if current_user.present? && is_producer?(current_user)
				@producer_name = current_user.full_name
				@commissions = Commission.where(producer_name: current_user.full_name).where(excercise_year_id: current_excercise.id)
			elsif current_user.present? && is_contributor?(current_user)
				@contributor_name = current_user.full_name
				@commissions = Commission.where(contributor_name: current_user.full_name).where(excercise_year_id: current_excercise.id)
			elsif is_admin?
				#@credits = get_main_admin(current_user).credits
				@credits = Credit.where(excercise_year_id: current_excercise.id)

				@banks_count = Bank.count 
				@customers_count = Customer.count 
				@credits_count = Credit.where(excercise_year_id: current_excercise.id).count 

				contributors_count = User.find_by_role('Apporteur').count
				producers_count = User.find_by_role('Producteur').count

				@producers_and_contributors_count = contributors_count.to_i + producers_count.to_i
			elsif is_superadmin?
				#@credits = current_user.credits
			
				if current_excercise.present?
					@credits = Credit.where(excercise_year_id: current_excercise.id)

					@banks_count = Bank.count 
					@customers_count = Customer.count 
					
					@credits_count = Credit.where(excercise_year_id: current_excercise.id).count 
			
					contributors_count = User.find_by_role('Apporteur').count
					producers_count = User.find_by_role('Producteur').count
	
					@producers_and_contributors_count = contributors_count.to_i + producers_count.to_i
				else
					@credits = Credit.all

					@banks_count = Bank.count 
					@customers_count = Customer.count 
					
					@credits_count = Credit.all.count 
			
					contributors_count = User.find_by_role('Apporteur').count
					producers_count = User.find_by_role('Producteur').count
	
					@producers_and_contributors_count = contributors_count.to_i + producers_count.to_i
				end
			end
		else
			redirect_to unauthorize_path
		end

		
	end

	def unauthorize
		render layout: 'unauthorize'
	end

	def create_company
		if request.subdomain.present? && request.subdomain != 'www'   

			#company = Company.all
		
			if  current_company.blank? && is_admin?
				redirect_to new_company_path
			end	
		end
	end

	
	
	def if_excercise_year
		if request.subdomain.present? && request.subdomain != 'www'   
		  if current_user.role == "Admin" && current_company.present?
			#excercises = ExcerciseYear.all
			unless current_excercise.present? 
			  redirect_to new_excercise_year_path
			end
		  end
		end
	  end
	
	
	def load_session
		#session[:current_excercise] = nil
		if request.subdomain.present? && request.subdomain != 'www'   
			if current_user.role == "Admin"

					# Get all excercises
				puts "LOAD SESSION START "
				if excercise_exist?
					puts "EXCERCISE EXIST"
					if excercise_openned?
						unless session[:current_excercise]
							session[:current_excercise] = openned_excercise.id
							puts "HUMMM SESSION ID: #{session[:current_excercise]}"
							#redirect_to dashboard_path
							#dashboard_path
						end
					else
						excercise_years_path
					end
				else
					puts "EXCERCISE DON'T EXIST"
					redirect_to new_excercise_year_path
				end
			end
		end
		
		
	end

end