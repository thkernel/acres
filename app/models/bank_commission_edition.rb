# == Schema Information
#
# Table name: bank_commission_editions
#
#  id         :bigint           not null, primary key
#  date_effet :date
#  completed  :string           default("no")
#  old_value  :float
#  new_value  :float
#  bank_id    :bigint           not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class BankCommissionEdition < ApplicationRecord
    belongs_to :bank
    
end
