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
  has_many :banks, dependent: :destroy
  has_many :logs, dependent: :destroy
  #has_many :customers, dependent: :destroy
  #has_many :notaries, dependent: :destroy
  has_many :credits, dependent: :destroy
  has_many :commissions, dependent: :destroy
  has_many :commission_settings, dependent: :destroy
  has_many :bank_commission_rate_abandonments, dependent: :destroy
  has_many :borderaus, dependent: :destroy
  has_many :payment_timetables, dependent: :destroy
  has_many :monthly_installment_delay_expireds, dependent: :destroy
  has_many :bank_settings, dependent: :destroy




  validates :name, presence: true, uniqueness: true

  before_save :set_status

  # Constantes
  STATUS = [["Open"], ["Close"]]

  def set_status
    unless self.status.present?
      self.status = "Open"
    end
  end
end
