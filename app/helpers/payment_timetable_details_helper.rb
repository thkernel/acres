module PaymentTimetableDetailsHelper
    def credit_customer_name_from_payment_timetable(id)
        payment_timetable = PaymentTimetable.find(id)
        credit = Credit.find_by(identifier: payment_timetable.credit_identifier)
        credit.customer_name
    end
end
