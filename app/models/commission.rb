class Commission < ApplicationRecord
    require 'csv'

    # Relationship.
    belongs_to :user

    # Search
    def self.search(production_date, acte_date, bank_name, producer_name, contributor_name, notary_name)
        
        if  bank_name.present? && producer_name.present? && contributor_name.present?
            where('bank_name = ? AND producer_name = ? AND contributor_name= ?',   "#{bank_name}", "#{producer_name}", "#{contributor_name}")
        end

        if  notary_name.present?
            where(' notary_name= ?',    "#{notary_name}")
        end

        if bank_name.present?
            where('bank_name = ?', "#{bank_name}")
        end

        if producer_name.present?
            where('producer_name = ?', "#{producer_name}")
        end

        if contributor_name.present?
            where('contributor_name = ?', "#{contributor_name}")
        end


        if production_date.present?
            where('production_date = ?', "#{production_date}")
        end

        if acte_date.present?
            where('acte_date = ?', "#{acte_date}")
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
