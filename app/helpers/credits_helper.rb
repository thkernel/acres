module CreditsHelper
    def credit_customer_name(credit_identifier)
        #credit = Credit.find_by(credit_id: credit_id)
        credit = Credit.where(["identifier = ? AND excercise_year_id = ?",  credit_identifier, current_excercise.id]).take
        #credit = Credit.find_by(identifier: credit_identifier)

		if credit.present?
			credit.customer_name 
		end
	end


	def credit_acte_date(credit_identifier)
        #credit = Credit.find_by(credit_id: credit_id)
        credit = Credit.where(["identifier = ? AND excercise_year_id = ?", credit_identifier, current_excercise.id]).take
		credit.acte_date if credit.acte_date.present?
	end

	

end
