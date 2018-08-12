json.extract! credit_detail, :id, :installment_payment, :installment_date, :commission, :cumulative_amount, :paid_by_bank, :paid_to_contributor_or_producer, :created_at, :updated_at
json.url credit_detail_url(credit_detail, format: :json)
