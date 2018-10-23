class Customer < ApplicationRecord
    belongs_to :user
    validates_presence_of :full_name

    # Find bank by name.

    def self.exists(full_name, user_id)
        where('full_name = ? AND user_id = ?', full_name, user_id)
    end
end
