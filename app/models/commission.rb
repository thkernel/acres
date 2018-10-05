class Commission < ApplicationRecord
    require 'csv'

    # Relationship.
    belongs_to :user

    # Search
    def self.search(production_date, acte_date, bank_name, producer_name, contributor_name, notary_name, user_id)
        
        if  notary_name.present?
            query = Commission.order(:production_date)
            query = query.where("production_date = ? AND acte_date = ? AND notary_name =  ?", production_date, acte_date, notary_name) if notary_name.present?
            query = query.where("user_id = ? ", user_id) 

            query
        
        else 
            query = Commission.order(:production_date)
            #query = query.where("production_date = ? AND acte_date = ? AND bank_name = ? AND contributor_name = ? AND producer_name = ?", production_date, acte_date, bank_name, contributor_name, producer_name) if production_date.present?
            query = query.where("production_date = ? AND acte_date = ? ", production_date, acte_date) if production_date.present?
            query = query.where("bank_name IN (?) ", bank_name) if bank_name.present?
            query = query.where("producer_name IN (?) ", producer_name) if producer_name.present?
            query = query.where("contributor_name IN (?) ", contributor_name) if contributor_name.present?
            query = query.where("user_id = ? ", user_id)
            query
        
        end
       

        

        
    end

    def self.search_by_bank_and_user(bank_name, user)
        where('bank_name = ? AND user_id = ?', bank_name, user)
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
