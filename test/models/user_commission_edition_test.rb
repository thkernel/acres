# == Schema Information
#
# Table name: user_commission_editions
#
#  id                    :bigint           not null, primary key
#  date_effet            :date
#  completed             :string           default("no")
#  old_value             :float
#  new_value             :float
#  commission_setting_id :bigint           not null
#  user_id               :bigint           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'test_helper'

class UserCommissionEditionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
