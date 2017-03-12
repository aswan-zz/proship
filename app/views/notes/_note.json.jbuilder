json.extract! note, :id, :content, :note_type_id, :member_from_id, :member_to_id, :created_at, :updated_at
json.url note_url(note, format: :json)
