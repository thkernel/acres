json.extract! payment_timetable_detail, :id, :payment_timetable_id, :status, :created_at, :updated_at
json.url payment_timetable_detail_url(payment_timetable_detail, format: :json)
