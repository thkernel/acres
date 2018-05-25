json.extract! log, :id, :file_name, :no_record, :error, :status, :created_at, :updated_at
json.url log_url(log, format: :json)
