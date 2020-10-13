Rails.application.routes.draw do
  get 'ingredient/delete'
  resources :recipes
  root 'recipes#index'

  post '/add-recipe', to: "recipes#createRecipe"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
