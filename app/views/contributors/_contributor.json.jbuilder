json.extract! contributor, :id, :first_name, :last_name, :address, :phone, :email, :city, :country, :notes, :created_at, :updated_at
json.url contributor_url(contributor, format: :json)
