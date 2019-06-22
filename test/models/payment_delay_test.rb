# == Schema Information
#
# Table name: payment_delays
#
#  id                               :bigint           not null, primary key
#  first_installment                :string
#  monthly_deadlines_before_payment :integer
#  monthly_installments             :string
#  user_id                          :bigint
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#

require 'test_helper'

class PaymentDelayTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
