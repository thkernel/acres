module CheckExcerciseYearConcern
    extend ActiveSupport::Concern 

    def current_excercise_year
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
                        #excercise_years_path
                        puts "NOT OPENED EXCERCISE"
                        redirect_to excercise_years_path #and return
					end
				else
					puts "EXCERCISE DON'T EXIST"
					redirect_to new_excercise_year_path 
				end
			end
		end
		
		
	
    end
end