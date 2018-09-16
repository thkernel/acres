class Commission < ApplicationRecord
    require 'csv'

    # Relationship.
    belongs_to :user

    # Search
    def self.search(production_date, acte_date, bank_name, producer_name, contributor_name, notary_name)
        
        if  notary_name.present?
            query = Commission.order(:production_date)
            query = query.where("production_date = ? AND acte_date = ? AND notary_name =  ?", production_date, acte_date, notary_name) if notary_name.present?
            query
        
        else 
            query = Commission.order(:production_date)
            #query = query.where("production_date = ? AND acte_date = ? AND bank_name = ? AND contributor_name = ? AND producer_name = ?", production_date, acte_date, bank_name, contributor_name, producer_name) if production_date.present?
            query = query.where("production_date = ? AND acte_date = ?", production_date, acte_date) if production_date.present?
            

            query = query.where("bank_name = ?",  bank_name) if bank_name.present?
            #query = query.where("contributor_name = ?",  contributor_name) if contributor_name.present?
            #query = query.where("producer_name = ?",  producer_name) if producer_name.present?
            query
        
        end
       

        

        
    end

    

    def self.to_csv(options = {})
    CSV.generate(options) do |csv|
        csv << column_names
        all.each do |product|
        csv << product.attributes.values
        end
    end
    end

end
