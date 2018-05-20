json.extract! client, :id, :first_name, :last_name, :gender, :address, :city, :country, :phone, :created_at, :updated_at
json.url client_url(client, format: :json)
