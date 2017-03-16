json.extract! meeting, :id, :meeting_type_id, :scheduled, :note, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)
