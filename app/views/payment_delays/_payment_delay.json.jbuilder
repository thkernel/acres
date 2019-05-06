json.extract! payment_delay, :id, :first_installment, :monthly_deadlines_before_payment, :monthly_installments, :user_id, :created_at, :updated_at
json.url payment_delay_url(payment_delay, format: :json)
