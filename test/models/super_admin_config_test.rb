# == Schema Information
#
# Table name: super_admin_configs
#
#  id         :bigint           not null, primary key
#  login      :string
#  email      :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class SuperAdminConfigTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
