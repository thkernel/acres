json.extract! notary, :id, :full_name, :address, :phone, :email, :created_at, :updated_at
json.url notary_url(notary, format: :json)
