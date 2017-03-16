json.extract! meeting_member, :id, :member_id, :meeting_id, :created_at, :updated_at
json.url meeting_member_url(meeting_member, format: :json)
