# == Schema Information
#
# Table name: commissions
#
#  id                                :bigint           not null, primary key
#  credit_identifier                 :bigint
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
#  excercise_year_id                 :bigint
#

class Commission < ApplicationRecord
    require 'csv'

    # Relationship.
    belongs_to :user


    validates :bank_name, presence: true
    
    # Search
    def self.search(date_debut, date_fin,  bank_name, producer_name, contributor_name, notary_name, current_excercise, search_term)
        
        if  notary_name.present?
           
            query = Commission.order(:production_date)
            query = query.where(excercise_year_id: current_excercise)

            if search_term == "Par date de production"
                query = query.where("production_date BETWEEN ? AND ? ", date_debut, date_fin) if date_debut.present? and  date_fin.present?
            end

            if search_term == "Par date d'acte"
                query = query.where("acte_date BETWEEN ? AND ? ", date_debut, date_fin) if date_debut.present? and  date_fin.present?
            end
            query = query.where("notary_name =  ?", notary_name) if notary_name.present?
           

            
            query
        
        else 
            query = Commission.order(:production_date)
            query = query.where(excercise_year_id: current_excercise)
            #query = query.where("production_date = ? AND acte_date = ? AND bank_name = ? AND contributor_name = ? AND producer_name = ?", production_date, acte_date, bank_name, contributor_name, producer_name) if production_date.present?
            
            if search_term == "Par date de production"
                query = query.where("production_date BETWEEN ? AND ? ", date_debut, date_fin) if date_debut.present? and  date_fin.present?
            end

            if search_term == "Par date d'acte"
                query = query.where("acte_date BETWEEN ? AND ? ", date_debut, date_fin) if date_debut.present? and  date_fin.present?
            end
            
            query = query.where("bank_name IN (?) ", bank_name) if bank_name.present?
            query = query.where("producer_name IN (?) ", producer_name) if producer_name.present?
            query = query.where("contributor_name IN (?) ", contributor_name) if contributor_name.present?
            

            query
        
        end
        
    end


    # Search by production date
    def self.search_by_production_date(production_date_debut, production_date_fin,  bank_name, producer_name, contributor_name, notary_name, current_excercise)
        
        if  notary_name.present?
           
            query = Commission.order(:production_date)
            query = query.where(excercise_year_id: current_excercise)
            query = query.where("production_date BETWEEN ? AND ? ", production_date_debut, production_date_fin) if production_date_debut.present? and  production_date_fin.present?
            query = query.where("notary_name =  ?", notary_name) if notary_name.present?
           

            
            query
        
        else 
            query = Commission.order(:production_date)
            query = query.where(excercise_year_id: current_excercise)
            #query = query.where("production_date = ? AND acte_date = ? AND bank_name = ? AND contributor_name = ? AND producer_name = ?", production_date, acte_date, bank_name, contributor_name, producer_name) if production_date.present?
            query = query.where("production_date BETWEEN ? AND ? ", production_date_debut, production_date_fin) if production_date_debut.present? and  production_date_fin.present?

            query = query.where("bank_name IN (?) ", bank_name) if bank_name.present?
            query = query.where("producer_name IN (?) ", producer_name) if producer_name.present?
            query = query.where("contributor_name IN (?) ", contributor_name) if contributor_name.present?
            

            query
        
        end
        
    end


    # Search by acte date
    def self.search_by_acte_date(acte_date_debut,acte_date_fin, bank_name, producer_name, contributor_name, notary_name, current_excercise)
        
        if  notary_name.present?
           
            query = Commission.order(:production_date)
            query = query.where(excercise_year_id: current_excercise)
            query = query.where("acte_date BETWEEN ? AND ? ", acte_date_debut, acte_date_fin) if acte_date_debut.present? and  acte_date_fin.present?
            query = query.where("notary_name =  ?", notary_name) if notary_name.present?
           

            
            query
        
        else 
            query = Commission.order(:production_date)
            query = query.where(excercise_year_id: current_excercise)
            #query = query.where("production_date = ? AND acte_date = ? AND bank_name = ? AND contributor_name = ? AND producer_name = ?", production_date, acte_date, bank_name, contributor_name, producer_name) if production_date.present?
            query = query.where("acte_date BETWEEN ? AND ? ", acte_date_debut, acte_date_fin) if acte_date_debut.present? and  acte_date_fin.present?

            query = query.where("bank_name IN (?) ", bank_name) if bank_name.present?
            query = query.where("producer_name IN (?) ", producer_name) if producer_name.present?
            query = query.where("contributor_name IN (?) ", contributor_name) if contributor_name.present?
            

            query
        
        end
        
    end



    # Search
    def self.search_by_bank_and_production_date(production_date_debut, production_date_fin, bank_name, current_excercise)
        
        query = Commission.order(:production_date)
        query = query.where(excercise_year_id: current_excercise)
        query = query.where("production_date BETWEEN ? AND ? ", production_date_debut, production_date_fin) if production_date_debut.present? and  production_date_fin.present?
        query = query.where("bank_name =  ?", bank_name) if bank_name.present?

        query
        
    
    end

    def self.search_by_bank_and_acte_date(acte_date_debut, acte_date_fin, bank_name, current_excercise)
        
        query = Commission.order(:acte_date)
        query = query.where(excercise_year_id: current_excercise)
        query = query.where("acte_date BETWEEN ? AND ? ", acte_date_debut, acte_date_fin) if acte_date_debut.present? and  acte_date_fin.present?
        query = query.where("bank_name =  ?", bank_name) if bank_name.present?

        query
        
    
    end



    def self.acted(current_excercise)
        
       
            query = Commission.order(:production_date)
            query = query.where(excercise_year_id: current_excercise)
            #query = query.where("production_date = ? AND acte_date = ? AND bank_name = ? AND contributor_name = ? AND producer_name = ?", production_date, acte_date, bank_name, contributor_name, producer_name) if production_date.present?
            query = query.where("acte_date <> ''")
              
            query
        
        
    end


    def self.search_by_bank(bank_name, current_excercise)
        where('bank_name = ? AND excercise_year_id = ?', "#{bank_name}", "#{bank_name}")
    end
    
    

    

end
