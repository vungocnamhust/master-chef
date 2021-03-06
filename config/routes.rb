Rails.application.routes.draw do
  
  get 'sessions/new'
  resources :recipes
  resources :ingredient
  root 'chefs#index'

  post    '/add-recipe',            to: 'recipes#createRecipe'
  delete  '/ingredient/:id/delete', to: 'ingredient#destroy'
  delete  '/steps/:id/delete',      to: 'recipes#destroyStep'
  post    '/search',                to: 'recipes#index'

  get     '/signup',                to: 'chefs#new',            as: :newChef
  post    '/signup',                to: 'chefs#create',         as: :createChef
  get     '/chefs/:id',             to: 'chefs#show',           as: :showChef
  get     '/',                      to: 'chefs#index',          as: :indexChef

  get     '/login',                 to: 'sessions#new',         as: :login
  post    '/login',                 to: 'sessions#create',      as: :sessionsCreate
  delete  '/logout',                to: 'sessions#destroy',     as: :logout
end
