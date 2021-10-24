json.extract! address, :id, :name, :line_1, :line_2, :country, :city, :zip, :long, :lat, :created_at, :updated_at
json.url address_url(address, format: :json)
