module CreditDetailsHelper
    def current_company
	
		company = Company.take
		if company.present?
			company
		end
		
    end
    
end
