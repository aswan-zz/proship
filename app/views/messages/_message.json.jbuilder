json.extract! message, :id, :member_to_id, :member_from_id, :content, :parent, :created_at, :updated_at
json.url message_url(message, format: :json)
