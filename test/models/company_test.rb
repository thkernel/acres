# == Schema Information
#
# Table name: companies
#
#  id                 :bigint           not null, primary key
#  name               :string
#  address            :string
#  city               :string
#  country            :string
#  phone              :string
#  slug               :string
#  brand_file_name    :string
#  brand_content_type :string
#  brand_file_size    :integer
#  brand_updated_at   :datetime
#  user_id            :bigint           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class CompanyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
