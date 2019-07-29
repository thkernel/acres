# == Schema Information
#
# Table name: banks
#
#  id                                :bigint           not null, primary key
#  name                              :string
#  description                       :string
#  commission_percentage             :float            default(0.0)
#  hypoplus_commission_percentage    :float            default(0.0)
#  first_installment                 :float            default(0.0)
#  number_of_dates                   :integer          default(0)
#  phone                             :string
#  address                           :string
#  slug                              :string
#  user_id                           :bigint           not null
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#  number_of_remaining_days          :integer          default(0)
#  company_remaining_commission_rate :float            default(0.0)
#  excercise_year_id                 :bigint           default(0)
#

class Bank < ApplicationRecord
    belongs_to :user
    belongs_to :excercise_year
    has_many :bank_commission_editions, dependent: :destroy
    has_many :bank_commission_rate_trackers, dependent: :destroy

    validates_presence_of :name


    def self.find_by_array_of_names(names)
        where("name IN (?) ", names)
    end
    # Find bank by name.

    def self.exists(bank_name)
        where('name = ? ', bank_name)
    end

    def self.search(bank_name)
        where('name = ?', bank_name).take
    end
end
