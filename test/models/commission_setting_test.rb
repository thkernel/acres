# == Schema Information
#
# Table name: commission_settings
#
#  id                             :bigint           not null, primary key
#  commission_percentage          :float            default(0.0)
#  hypoplus_commission_percentage :float            default(0.0)
#  first_installment              :float            default(0.0)
#  number_of_dates                :integer          default(0)
#  slug                           :string
#  user_id                        :bigint           not null
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#

require 'test_helper'

class CommissionSettingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
