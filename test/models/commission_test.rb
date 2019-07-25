# == Schema Information
#
# Table name: commissions
#
#  id                                :bigint           not null, primary key
#  credit_id                         :bigint
#  production_date                   :date
#  acte_date                         :date
#  customer_id                       :integer
#  notary_name                       :string
#  bank_name                         :string
#  contributor_name                  :string
#  producer_name                     :string
#  company_name                      :string
#  contributor_commission_percentage :float            default(0.0)
#  contributor_commission            :float            default(0.0)
#  producer_commission_percentage    :float            default(0.0)
#  producer_commission               :float            default(0.0)
#  bank_commission_percentage        :float            default(0.0)
#  bank_commission                   :float            default(0.0)
#  company_commission_percentage     :float            default(0.0)
#  company_commission                :float            default(0.0)
#  amount_credit                     :float            default(0.0)
#  total_amount                      :float            default(0.0)
#  user_id                           :bigint           not null
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#  excercise_year_id                 :bigint           default(0)
#

require 'test_helper'

class CommissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
