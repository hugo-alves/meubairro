json.extract! reco, :id, :name, :description, :rating, :address, :latitude, :longitude, :created_at, :updated_at
json.url reco_url(reco, format: :json)