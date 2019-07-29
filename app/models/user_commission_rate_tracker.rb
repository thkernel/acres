# == Schema Information
#
# Table name: user_commission_rate_trackers
#
#  id                :bigint           not null, primary key
#  start_date        :datetime
#  old_rate          :float
#  new_rate          :float
#  user_id           :bigint
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  excercise_year_id :bigint           default(0)
#

class UserCommissionRateTracker < ApplicationRecord
  belongs_to :user
  belongs_to :excercise_year

end
