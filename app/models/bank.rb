class Bank < ApplicationRecord
    belongs_to :user
    validates_presence_of :name, :commission_percentage
end
