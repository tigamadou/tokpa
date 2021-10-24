json.extract! adress, :id, :name, :line_1, :line_2, :country, :city, :zip, :long, :lat, :created_at, :updated_at
json.url adress_url(adress, format: :json)
