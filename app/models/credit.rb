# == Schema Information
#
# Table name: credits
#
#  id                           :bigint           not null, primary key
#  identifier                   :bigint
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
#  excercise_year_id            :bigint
#

class Credit < ApplicationRecord
    #require 'csv'

    belongs_to :user
    belongs_to :excercise_year

    has_many :credit_details, dependent: :destroy


    validates :identifier, presence: true, uniqueness: true
    #validates :bank_id, presence: true

    #scope :name, -> { where(:attibute => value)}
    # Ex:- scope :active, -> {where(:active => true)}

    def self.credit_exist(credit_identifier, current_excercise)
        where('identifier = ? AND excercise_year_id = ? ', credit_identifier, current_excercise)
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
