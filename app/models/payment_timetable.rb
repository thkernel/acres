class PaymentTimetable < ApplicationRecord
  belongs_to :excercise_year
  has_many :payment_timetable_details, dependent: :destroy

end
