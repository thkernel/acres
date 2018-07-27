class Bank < ApplicationRecord
    belongs_to :user
    validates_presence_of :name, :commission_percentage

    # Find bank by name.

    def self.exists(bank_name)
        where('name = ?', bank_name)
    end
end
