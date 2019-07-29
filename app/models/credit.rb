# == Schema Information
#
# Table name: credits
#
#  id                           :bigint           not null, primary key
#  credit_id                    :bigint
#  production_date              :date
#  acte_date                    :date
#  customer_id                  :integer
#  bank_id                      :integer
#  amount                       :float
#  bank_name                    :string
#  customer_name                :string
#  producer_id                  :integer
#  producer_name                :string
#  contributor_id               :integer
#  contributor_name             :string
#  notary_name                  :string
#  hypoplus                     :string
#  total_commission_bank        :float
#  total_commission_producer    :float
#  total_commission_contributor :float
#  total_commission_company     :float
#  slug                         :string
#  user_id                      :bigint           not null
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#  excercise_year_id            :bigint           default(0)
#

class Credit < ApplicationRecord
    require 'csv'

    belongs_to :user
    belongs_to :excercise_year

    has_many :credit_details, dependent: :destroy


    validates :credit_id, presence: true, uniqueness: true
    #scope :name, -> { where(:attibute => value)}
    # Ex:- scope :active, -> {where(:active => true)}

    def self.credit_exist(credit_id)
        where('credit_id = ?', credit_id)
    end

    def self.to_csv(options = {})
        CSV.generate(options) do |csv|
            csv << column_names
            all.each do |product|
            csv << product.attributes.values
            end
        end
    end

    #def self.to_csv(options = {})
        #desired_columns = ["id", "name", "released_on", "price"]
        #CSV.generate(options) do |csv|
            #csv << desired_columns
            #all.each do |product|
            #csv << product.attributes.values_at(*desired_columns)
            #end
        #end
        #end


end
