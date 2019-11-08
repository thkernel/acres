module BanksHelper

    def bank_name(id)
        bank = Bank.find(id)
       
		bank.name
	end

    def get_bank_commission_rate(bank_name)
        bank = Bank.find_by(name: bank_name)
        #bank.commission_percentage
        current_bank_setting(bank).commission_percentage
    end

    def get_bank_name(bank_id)
        bank = Bank.find(bank_id)
		
    end
    
    def have_bank_settings?(bank)
        current_excercise = nil

        if session[:current_excercise]
            current_excercise = ExcerciseYear.find(session[:current_excercise])
        end


        bank_setting = BankSetting.where(["bank_id = ? AND excercise_year_id = ? ", bank.id, current_excercise.id ])
        if bank_setting.present?
            return true
        else
            return false
        end

    end

    def current_bank_setting(bank)
        current_excercise = nil

        if session[:current_excercise]
            current_excercise = ExcerciseYear.find(session[:current_excercise])
        end


        bank_setting = BankSetting.where(["bank_id = ? AND excercise_year_id = ? ", bank.id, current_excercise.id ]).take
        if bank_setting.present?
            bank_setting
        
        end
    end
    
end
