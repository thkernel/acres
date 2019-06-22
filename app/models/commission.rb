# == Schema Information
#
# Table name: commissions
#
#  id                                :bigint           not null, primary key
#  credit_id                         :bigint
#  production_date                   :date
#  acte_date                         :date
#  customer_id                       :integer
#  notary_name                       :string
#  bank_name                         :string
#  contributor_name                  :string
#  producer_name                     :string
#  company_name                      :string
#  contributor_commission_percentage :float            default(0.0)
#  contributor_commission            :float            default(0.0)
#  producer_commission_percentage    :float            default(0.0)
#  producer_commission               :float            default(0.0)
#  bank_commission_percentage        :float            default(0.0)
#  bank_commission                   :float            default(0.0)
#  company_commission_percentage     :float            default(0.0)
#  company_commission                :float            default(0.0)
#  amount_credit                     :float            default(0.0)
#  total_amount                      :float            default(0.0)
#  user_id                           :bigint           not null
#  created_at                        :datetime         not null
#  updated_at                        :datetime         not null
#

class Commission < ApplicationRecord
    require 'csv'

    # Relationship.
    belongs_to :user

    # Search
    def self.search(production_date_debut, production_date_fin,  acte_date_debut,acte_date_fin, bank_name, producer_name, contributor_name, notary_name)
        
        if  notary_name.present?
            query = Commission.order(:production_date)
            query = query.where("production_date BETWEEN ? AND ? ", production_date_debut, production_date_fin) if production_date_debut.present? and  production_date_fin.present?
            query = query.where("acte_date BETWEEN ? AND ? ", acte_date_debut, acte_date_fin) if acte_date_debut.present? and  acte_date_fin.present?
            query = query.where("notary_name =  ?", notary_name) if notary_name.present?
           

            
            query
        
        else 
            query = Commission.order(:production_date)
            #query = query.where("production_date = ? AND acte_date = ? AND bank_name = ? AND contributor_name = ? AND producer_name = ?", production_date, acte_date, bank_name, contributor_name, producer_name) if production_date.present?
            query = query.where("production_date BETWEEN ? AND ? ", production_date_debut, production_date_fin) if production_date_debut.present? and  production_date_fin.present?
            query = query.where("acte_date BETWEEN ? AND ? ", acte_date_debut, acte_date_fin) if acte_date_debut.present? and  acte_date_fin.present?

            query = query.where("bank_name IN (?) ", bank_name) if bank_name.present?
            query = query.where("producer_name IN (?) ", producer_name) if producer_name.present?
            query = query.where("contributor_name IN (?) ", contributor_name) if contributor_name.present?
            

            query
        
        end
       

        

        
    end

    # Search
    def self.search_by_bank_and_production_date(production_date_debut, production_date_fin, bank_name)
        
        query = Commission.order(:production_date)
        query = query.where("production_date BETWEEN ? AND ? ", production_date_debut, production_date_fin) if production_date_debut.present? and  production_date_fin.present?
        query = query.where("bank_name =  ?", bank_name) if bank_name.present?

        query
        
    
    end

    def self.search_by_bank_and_acte_date(acte_date_debut, acte_date_fin, bank_name)
        
        query = Commission.order(:acte_date)
        query = query.where("acte_date BETWEEN ? AND ? ", acte_date_debut, acte_date_fin) if acte_date_debut.present? and  acte_date_fin.present?
        query = query.where("bank_name =  ?", bank_name) if bank_name.present?

        query
        
    
    end



    def self.acted
        
       
            query = Commission.order(:production_date)
            #query = query.where("production_date = ? AND acte_date = ? AND bank_name = ? AND contributor_name = ? AND producer_name = ?", production_date, acte_date, bank_name, contributor_name, producer_name) if production_date.present?
            query = query.where("acte_date <> ''")
              
            query
        
        
    end


    def self.search_by_bank(bank_name)
        where('bank_name = ?', "#{bank_name}")
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
