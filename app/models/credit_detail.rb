class CreditDetail < ApplicationRecord
    belongs_to :credit

    YES_NO = [["Oui"], ["Non"]]
end
