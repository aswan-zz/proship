json.extract! reminder, :id, :member_id, :reminder_type_id, :note, :schedule, :created_at, :updated_at
json.url reminder_url(reminder, format: :json)
