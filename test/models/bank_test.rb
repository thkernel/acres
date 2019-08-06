# == Schema Information
#
# Table name: banks
#
#  id                                :bigint           not null, primary key
#  name                              :string
#  description                       :string
#  commission_percentage             :float            default(0.0)
#  hypoplus_commission_percentage    :float            default(0.0)
#  first_installment                 :float            default(0.0)
#  number_of_dates                   :integer          default(0)
#  phone                             :string
#  address                           :string
#  slug                              :string
#  user_id                           :bigint           not null
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#  number_of_remaining_days          :integer          default(0)
#  company_remaining_commission_rate :float            default(0.0)
#  excercise_year_id                 :bigint
#

require 'test_helper'

class BankTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
