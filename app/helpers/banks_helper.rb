module BanksHelper

    def bank_name(id)
        #bank = Bank.find(id)
        bank = Bank.where(["id = ? AND excercise_year_id", id, current_excercise.id]).take
		bank.name
	end

    def get_bank_commission_rate(bank_name)
        #bank = Bank.find_by(name: bank_name)
        bank = Bank.where(["name = ? AND excercise_year_id = ?",  bank_name, current_excercise.id]).take
		bank.commission_percentage
    end
    
end
