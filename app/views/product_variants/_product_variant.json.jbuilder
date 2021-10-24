json.extract! product_variant, :id, :price, :sku, :image, :quantity, :product_id, :created_at, :updated_at
json.url product_variant_url(product_variant, format: :json)
