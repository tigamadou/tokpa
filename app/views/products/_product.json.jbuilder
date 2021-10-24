json.extract! product, :id, :name, :slug, :description, :active, :available, :validated, :subcategory_id, :brand_id, :vendor_id, :created_at, :updated_at
json.url product_url(product, format: :json)
