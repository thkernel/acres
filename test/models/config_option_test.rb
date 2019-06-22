# == Schema Information
#
# Table name: config_options
#
#  id             :bigint           not null, primary key
#  app_name       :string
#  admin_name     :string
#  admin_email    :string
#  admin_password :string
#  admin_role     :string           default("Admin")
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'test_helper'

class ConfigOptionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
