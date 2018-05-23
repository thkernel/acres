json.extract! producer, :id, :first_name, :last_name, :address, :phone, :email, :city, :country, :notes, :created_at, :updated_at
json.url producer_url(producer, format: :json)
