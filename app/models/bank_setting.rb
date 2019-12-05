# == Schema Information
#
# Table name: bank_settings
#
#  id                                :bigint           not null, primary key
#  commission_percentage             :float
#  hypoplus_commission_percentage    :float
#  first_installment                 :float
#  number_of_dates                   :integer
#  number_of_remaining_days          :integer
#  company_remaining_commission_rate :float
#  excercise_year_id                 :bigint
#  bank_id                           :bigint
#  status                            :string
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#

class BankSetting < ApplicationRecord
  belongs_to :excercise_year
  belongs_to :bank
end
