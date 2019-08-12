module SharedUtils
    module Extractor
        def self.extract_numeric(string)
            #output = string.scan(/\d+/).join("")
            string = string.to_s
            output = string.gsub(/[^0-9]/, '')

            puts "TRAITEMENT DES ID DOSSIERS"
            puts "Source: #{string}, Sortie: #{output}"
            output
        end
    end

    module CronLogger
        def cron_logger
            @@cron_logger ||= Logger.new("#{Rails.root}/log/cron-log.log")
        end
    
    end

    module Duplicate
        def self.is_duplicate?(row, cel)
            current_credit = Extractor.extract_number(row[cell[0]]).present?
            #credit = Credit.find_by(identifier: current_credit)
            credit = Credit.where(["identifier = ? AND excercise_year_id = ?",  current_credit, current_excercise.id]).take
            if credit
                true 
            else
                false
            end
        end
    end

    module ExcerciseYearMixin 
       
    
        def openned_excercise
            
                
            excercise = ExcerciseYear.where(status: "Open").take 
           

        end
    
    end
end