module Borderau 
    def generate_borderau
        # Credit
        # CreditDeatils
        # Generate borderau.

    end

    def export_to_xls(credit_identifier)
        credit_details = CreditDetail.find_by(credit_identifier: credit_identifier)
    end
end