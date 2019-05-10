module SharedUtils
    module Extractor
        def self.extract_numeric(string)
            output = string.scan(/\d/).join
            puts "TRAITEMENT DES ID DOSSIERS"
            puts "Source: #{string}, Sortie: #{output}"
            output
        end
    end

    module Duplicate
        def self.is_duplicate?(row, cel)
            current_credit = Extractor.extract_number(row[cell[0]]).present?
            credit = Credit.find_by(credit_id: current_credit)
            if true
                true 
            else
                false
            end
        end
    end
end