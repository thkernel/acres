# == Schema Information
#
# Table name: credits
#
#  id                           :bigint           not null, primary key
#  identifier                   :bigint
#  production_date              :date
#  acte_date                    :date
#  customer_id                  :integer
#  bank_id                      :integer
#  amount                       :float
#  bank_name                    :string
#  customer_name                :string
#  producer_id                  :integer
#  producer_name                :string
#  contributor_id               :integer
#  contributor_name             :string
#  notary_name                  :string
#  hypoplus                     :string
#  total_commission_bank        :float
#  total_commission_producer    :float
#  total_commission_contributor :float
#  total_commission_company     :float
#  slug                         :string
#  user_id                      :bigint           not null
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  excercise_year_id            :bigint
#

require 'test_helper'

class CreditTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
