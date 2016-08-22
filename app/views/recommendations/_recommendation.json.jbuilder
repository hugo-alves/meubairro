json.extract! recommendation, :id, :name, :description, :rating, :address, :latitude, :longitude, :created_at, :updated_at
json.url recommendation_url(recommendation, format: :json)
