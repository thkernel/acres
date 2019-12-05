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
#  avatar_file_size    :bigint
#  avatar_updated_at   :datetime
#  user_id             :bigint           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  full_name           :string
#

require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
