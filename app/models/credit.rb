class Credit < ApplicationRecord
    belongs_to :user

    # Search
    def self.search(bank_name)
        if bank_name.present?
            where('bank_name = ?', "#{bank_name}")
        end
    end
end
