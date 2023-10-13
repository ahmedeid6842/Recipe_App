Rails.application.routes.draw do
  devise_for :users

  root "foods#index"

  resources :recipes do
    resources :shopping_list, only: %i[index]
  end
  resources :recipe_foods
  resources :foods
  resources :public_recipes, only: %i[index]
end
