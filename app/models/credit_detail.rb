# == Schema Information
#
# Table name: credit_details
#
#  id                              :bigint           not null, primary key
#  installment_payment             :string
#  installment_date                :date
#  commission                      :float            default(0.0)
#  cumulative_amount               :float            default(0.0)
#  paid_by_bank                    :string           default("Non")
#  paid_to_contributor_or_producer :string           default("Non")
#  credituid                       :bigint           not null
#  credit_id                       :bigint           not null
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  excercise_year_id               :bigint
#

class CreditDetail < ApplicationRecord
    belongs_to :credit


    YES_NO = [["Oui"], ["Non"]]



    def self.search_by_credit_id(credit_id)
        where('credit_id = ?', credit_id)
    end
end
