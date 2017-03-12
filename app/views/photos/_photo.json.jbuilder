json.extract! photo, :id, :original_name, :file_name, :profile, :image_data, :created_at, :updated_at
json.url photo_url(photo, format: :json)
