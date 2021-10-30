json.extract! cart, :id, :total, :user_id, :created_at, :updated_at
json.url cart_url(cart, format: :json)
