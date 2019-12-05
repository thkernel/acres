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
#  excercise_year_id                 :bigint
#

class Bank < ApplicationRecord
    belongs_to :user
    belongs_to :excercise_year
    has_many :bank_settings, dependent: :destroy
    has_many :bank_commission_editions, dependent: :destroy
    has_many :bank_commission_rate_trackers, dependent: :destroy

    validates_presence_of :name


    def self.find_by_array_of_names(bank_names)
        where("name IN (?)", bank_names)
       
    end
    # Find bank by name.

    def self.exists(bank_name)
        where('name = ? ', bank_name)
        #where(["name = ? AND excercise_year_id = ?",  bank_name, current_excercise]).take
        
    end

    def self.search(bank_name, current_excercise)
        where('name = ?', bank_name).take
        #query = query.where(["name = ? AND excercise_year_id = ?",  bank_name, current_excercise]).take
        #query
    end
end
