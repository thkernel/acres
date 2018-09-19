class Bank < ApplicationRecord
    belongs_to :user
    has_many :commission_percentage_edits, dependent: :destroy

    validates_presence_of :name, :commission_percentage

    # Find bank by name.

    def self.exists(bank_name)
        where('name = ?', bank_name).take
    end
end
