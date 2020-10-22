Rails.application.routes.draw do
  
  resources :recipes
  resources :ingredient
  resources :chefs
  root 'chefs#new'

  post '/add-recipe', to: "recipes#createRecipe"
  delete '/ingredient/:id/delete', to: "ingredient#destroy"
  delete '/steps/:id/delete', to: "recipes#destroyStep"
  post '/search', to: "recipes#index"
  get '/signup', to: "chefs#new"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
