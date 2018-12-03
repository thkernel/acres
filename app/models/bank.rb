class Bank < ApplicationRecord
    belongs_to :user
    has_many :bank_commission_editions, dependent: :destroy

    validates_presence_of :name

    # Find bank by name.

    def self.exists(bank_name)
        where('name = ? ', bank_name)
    end

    def self.search(bank_name)
        where('name = ?', bank_name).take
    end
end
