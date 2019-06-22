# == Schema Information
#
# Table name: mail_configurations
#
#  id                   :bigint           not null, primary key
#  host                 :string
#  user_name            :string
#  password             :string
#  domain               :string
#  address              :string
#  port                 :integer
#  authentication       :string
#  enable_starttls_auto :boolean
#  ssl                  :boolean
#  slug                 :string
#  user_id              :bigint           not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'test_helper'

class MailConfigurationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
