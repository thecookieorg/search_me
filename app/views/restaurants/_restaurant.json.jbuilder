json.extract! restaurant, :id, :name, :address, :latitude, :longitude, :about, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
