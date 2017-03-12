json.extract! member, :id, :first_name, :last_name, :pronounce, :email, :birthday, :address, :city, :state_prov, :country, :zip_post, :home_airport, :medical_conditions, :criminal_convictions, :residency, :citizenship, :employee_number, :created_at, :updated_at
json.url member_url(member, format: :json)
