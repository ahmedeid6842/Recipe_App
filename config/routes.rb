Rails.application.routes.draw do
  devise_for :users

  root "foods#index"

  resources :recipes
  resources :recipe_foods
  resources :foods


  # Defines the root path route ("/")
  # root "articles#index"
end
