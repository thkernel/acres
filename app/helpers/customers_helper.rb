module CustomersHelper
    def customer(credit_identifier)
        credit = Credit.where(["identifier = ? AND excercise_year_id = ?",  credit_identifier, current_excercise.id]).take
        
        puts "CREDIT IDENTIFIER: #{credit_identifier}"
        puts "CREDIT : #{credit.inspect}"

        if credit.present?
            puts "CUSTOMER NAME: #{credit.customer_name}"
			return credit
		end
    end

end
