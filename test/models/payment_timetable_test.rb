# == Schema Information
#
# Table name: payment_timetables
#
#  id                :bigint           not null, primary key
#  target            :string
#  credit_identifier :string
#  excercise_year_id :bigint
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class PaymentTimetableTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
