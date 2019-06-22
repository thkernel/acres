# == Schema Information
#
# Table name: customers
#
#  id                  :bigint           not null, primary key
#  gender              :string
#  address             :string
#  city                :string
#  country             :string
#  phone               :string
#  slug                :string
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  user_id             :bigint           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  full_name           :string
#

class Customer < ApplicationRecord
    belongs_to :user
    validates_presence_of :full_name

    # Find bank by name.

    def self.exists(full_name)
        where('full_name = ?', full_name)
    end
end
