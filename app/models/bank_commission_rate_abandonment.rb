# == Schema Information
#
# Table name: bank_commission_rate_abandonments
#
#  id                :bigint           not null, primary key
#  bank_name         :string
#  current_bank_rate :float            default(0.0)
#  abandonment_rate  :float            default(0.0)
#  credit_identifier :bigint
#  excercise_year_id :bigint
#  user_id           :bigint
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class BankCommissionRateAbandonment < ApplicationRecord
    belongs_to :excercise_year
    belongs_to :user
end
