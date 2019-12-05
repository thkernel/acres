# == Schema Information
#
# Table name: profiles
#
#  id                  :bigint           not null, primary key
#  first_name          :string
#  last_name           :string
#  phone               :string
#  address             :string
#  slug                :string
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :bigint
#  avatar_updated_at   :datetime
#  user_id             :bigint           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Profile < ApplicationRecord
    belongs_to :user
end
