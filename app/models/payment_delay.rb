# == Schema Information
#
# Table name: payment_delays
#
#  id                               :bigint           not null, primary key
#  first_installment                :string
#  monthly_deadlines_before_payment :integer
#  monthly_installments             :string
#  user_id                          :bigint
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#

class PaymentDelay < ApplicationRecord
  belongs_to :user

  # validation
  validates :first_installment, presence: true
  validates :monthly_deadlines_before_payment, presence: true
  validates :monthly_installments, presence: true


  # Constantes
  FIRST_INSTALLMENT = [["Début mois suivant (+15 jours)"],["Fin mois suivant"], ["+1 Mois et 15 jours"], ["Fin du 2ème mois"]]
  MONTHLY_INSTALLMENTS = [["Mois suivant (+15 jours)"], ["+1 mois et 15 jours"], ["Fin du 2ème mois"]]
end
