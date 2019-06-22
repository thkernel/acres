# == Schema Information
#
# Table name: public.accounts
#
#  id         :bigint           not null, primary key
#  company    :string           not null
#  subdomain  :string           not null
#  status     :boolean
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
