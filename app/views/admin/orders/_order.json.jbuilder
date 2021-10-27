json.extract! order, :id, :reference, :total, :paid, :user_id, :vendor_id, :created_at, :updated_at
json.url order_url(order, format: :json)
