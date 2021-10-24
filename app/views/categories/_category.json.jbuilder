json.extract! category, :id, :name, :slug, :image, :activated, :created_at, :updated_at
json.url category_url(category, format: :json)
