class DispatcherController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if_excercise_year
  end

  def if_excercise_year
    if request.subdomain.present? && request.subdomain != 'www'   
      if current_user.role == "Admin"
        #excercises = ExcerciseYear.all
        unless current_excercise.present? 
          redirect_to new_excercise_year_path
        end
      end
    end
  end


end
