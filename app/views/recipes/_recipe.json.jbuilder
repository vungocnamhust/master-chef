json.extract! recipe, :id, :description, :name, :avatar_url, :chef_id, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)