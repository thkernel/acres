module ExcerciseYearsHelper

    def current_excercise
        excercise = ExcerciseYear.where(status: "open").take
        
    end
end
