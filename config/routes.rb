Rails.application.routes.draw do
  
  resources :recipes
  resources :ingredient
  root 'chefs#index'

  post '/add-recipe', to: "recipes#createRecipe"
  delete '/ingredient/:id/delete', to: "ingredient#destroy"
  delete '/steps/:id/delete', to: "recipes#destroyStep"
  post '/search', to: "recipes#index"

  get '/signup', to: "chefs#new",as: :newChef
  post '/signup', to: "chefs#create",as: :createChef
  get '/chefs/:id', to: "chefs#show",as: :showChef
  get '/', to: "chefs#index",as: :indexChef

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
