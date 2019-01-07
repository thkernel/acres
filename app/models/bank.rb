class Bank < ApplicationRecord
    belongs_to :user
    has_many :bank_commission_editions, dependent: :destroy

    validates_presence_of :name


    def self.find_by_array_of_names(names)
        where("name IN (?) ", names)
    end
    # Find bank by name.

    def self.exists(bank_name)
        where('name = ? ', bank_name)
    end

    def self.search(bank_name)
        where('name = ?', bank_name).take
    end
end
