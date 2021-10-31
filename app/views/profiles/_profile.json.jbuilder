json.extract! profile, :id, :first_name, :last_name, :phone_1, :phone_2, :image, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
