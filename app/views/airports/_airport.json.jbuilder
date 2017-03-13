json.extract! airport, :id, :name, :city, :country, :iata_faa, :iaco, :latitude, :longitude, :altitude, :zone, :dst, :created_at, :updated_at
json.url airport_url(airport, format: :json)
