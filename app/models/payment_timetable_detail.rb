# == Schema Information
#
# Table name: payment_timetable_details
#
#  id                              :bigint           not null, primary key
#  payment_timetable_id            :bigint
#  installment_payment             :string
#  installment_date                :date
#  commission                      :float            default(0.0)
#  cumulative_amount               :float            default(0.0)
#  paid_by_bank                    :string           default("Non")
#  paid_to_contributor_or_producer :string           default("Non")
#  status                          :string
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#

class PaymentTimetableDetail < ApplicationRecord
  belongs_to :payment_timetable
end
