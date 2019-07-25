# == Schema Information
#
# Table name: excercise_years
#
#  id         :bigint           not null, primary key
#  name       :string
#  start_date :date
#  end_date   :date
#  status     :string
#  close_at   :string
#  user_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ExcerciseYear < ApplicationRecord
  belongs_to :user
  before_save :set_status

  def set_status
    unless self.status.present?
      self.status = "open"
    end
  end
end
