json.extract! bank_setting, :id, :commission_percentage, :hypoplus_commission_percentage, :first_installment, :number_of_dates, :number_of_remaining_days, :company_remaining_commission_rate, :excercise_year_id, :bank_id, :status, :created_at, :updated_at
json.url bank_setting_url(bank_setting, format: :json)
