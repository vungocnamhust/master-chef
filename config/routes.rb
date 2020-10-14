Rails.application.routes.draw do
  
  resources :recipes
  resources :ingredient
  root 'recipes#index'

  post '/add-recipe', to: "recipes#createRecipe"
  delete '/ingredient/:id/delete', to: "ingredient#destroy"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
