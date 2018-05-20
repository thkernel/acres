json.extract! customer, :id, :first_name, :last_name, :gender, :address, :city, :country, :phone, :created_at, :updated_at
json.url customer_url(customer, format: :json)
