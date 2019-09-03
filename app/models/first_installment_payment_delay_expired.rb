# == Schema Information
#
# Table name: first_installment_payment_delay_expireds
#
#  id                           :bigint           not null, primary key
#  credit_identifier            :bigint
#  expiration_date              :datetime
#  first_installment_percentage :float            default(0.0)
#  installment_amount           :float            default(0.0)
#  credit_amount                :float            default(0.0)
#  status                       :string
#  user_id                      :bigint
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class FirstInstallmentPaymentDelayExpired < ApplicationRecord
  belongs_to :user

end
