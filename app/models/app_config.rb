class AppConfig < ApplicationRecord
    belongs_to :user
    has_one :company , dependent: :destroy
    # Add nested attributes for profile.
    accepts_nested_attributes_for :company
end
