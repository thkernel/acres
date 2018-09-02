class Credit < ApplicationRecord
    require 'csv'

    belongs_to :user
    has_many :credit_details, dependent: :destroy

    

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
