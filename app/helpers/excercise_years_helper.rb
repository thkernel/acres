module ExcerciseYearsHelper

    def current_excercise
        excercise = ExcerciseYear.where(status: "Open").take 
        
    end
end
