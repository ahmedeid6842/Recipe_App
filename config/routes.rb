Rails.application.routes.draw do
  devise_for :users

  root "foods#index"

  resources :recipes
  resources :recipe_foods
  resources :foods
  resources :public_recipes, only: %i[index]  
end
