Rails.application.routes.draw do
  get 'recipe/index'
  root 'recipe#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
