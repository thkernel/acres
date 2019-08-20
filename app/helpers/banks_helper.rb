module BanksHelper

    def bank_name(id)
        bank = Bank.find(id)
       
		bank.name
	end

    def get_bank_commission_rate(bank_name)
        bank = Bank.find_by(name: bank_name)
		bank.commission_percentage
    end

    def get_bank_name(bank_id)
        bank = Bank.find(bank_id)
		
	end
    
end
