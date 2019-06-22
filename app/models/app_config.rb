# == Schema Information
#
# Table name: app_configs
#
#  id         :bigint           not null, primary key
#  name       :string
#  url        :string
#  icon       :string
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AppConfig < ApplicationRecord
    belongs_to :user
    #has_one :company , dependent: :destroy
    # Add nested attributes for profile.
    #accepts_nested_attributes_for :company
end
