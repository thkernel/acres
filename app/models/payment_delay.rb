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
