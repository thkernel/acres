class Bank < ApplicationRecord
    belongs_to :user
    has_many :bank_commission_editions, dependent: :destroy

    validates_presence_of :name, :commission_percentage

    # Find bank by name.

    def self.exists(bank_name, user_id)
        where('name = ? AND user_id = ?', bank_name,user_id)
    end

    def self.search(bank_name, user_id)
        where('name = ? AND user_id = ?', bank_name, user_id).take
    end
end
