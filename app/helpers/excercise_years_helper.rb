module ExcerciseYearsHelper

    def current_excercise
        excercise = ExcerciseYear.find(session[:current_excercise])
        
    end

    def openned_excercise
        excercise = ExcerciseYear.where(status: "Open").take 

    end

    def excercise_exist?
        excercises = ExcerciseYear.all 
        if excercises.present?
            true
        else
            false
        end
    end
    def excercise_openned?
        excercise = ExcerciseYear.where(status: "Open").take 
        if excercise_exist? && excercise.present?
            true
        else
            false 
        end
           
        
    end
end
