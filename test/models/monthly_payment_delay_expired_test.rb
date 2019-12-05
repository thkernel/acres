# == Schema Information
#
# Table name: monthly_payment_delay_expireds
#
#  id                :bigint           not null, primary key
#  credit_identifier :bigint
#  expiration_date   :datetime
#  installment       :string
#  target            :string
#  payment_amount    :float            default(0.0)
#  status            :string
#  excercise_year_id :bigint
#  user_id           :bigint
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class MonthlyPaymentDelayExpiredTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
