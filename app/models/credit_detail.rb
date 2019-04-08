class CreditDetail < ApplicationRecord
    belongs_to :credit

    YES_NO = [["Oui"], ["Non"]]



    def self.search_by_credit_id(credit_id)
        where('credit_id = ?', credit_id)
    end
end
