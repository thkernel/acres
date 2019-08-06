# == Schema Information
#
# Table name: bank_commission_rate_trackers
#
#  id                :bigint           not null, primary key
#  start_date        :datetime
#  old_rate          :float            default(0.0)
#  new_rate          :float            default(0.0)
#  bank_id           :bigint
#  user_id           :bigint
#  status            :string           default("enable")
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  excercise_year_id :bigint
#

class BankCommissionRateTracker < ApplicationRecord
  belongs_to :bank
  belongs_to :excercise_year

  #belongs_to :user
end
