json.extract! image_collection, :id, :name, :created_at, :updated_at
json.url image_collection_url(image_collection, format: :json)