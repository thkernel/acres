class Customer < ApplicationRecord
    belongs_to :user
    validates_presence_of :full_name

    # Find bank by name.

    def self.exists(full_name)
        where('full_name = ?', full_name)
    end
end
