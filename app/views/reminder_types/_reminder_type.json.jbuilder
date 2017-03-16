json.extract! reminder_type, :id, :name, :icon, :default_color, :created_at, :updated_at
json.url reminder_type_url(reminder_type, format: :json)
