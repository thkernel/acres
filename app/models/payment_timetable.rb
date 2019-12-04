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

class PaymentTimetable < ApplicationRecord
  belongs_to :excercise_year
  
  has_many :payment_timetable_details, dependent: :destroy

end
