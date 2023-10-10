Rails.application.routes.draw do
  devise_for :users

  root "foods#index"

  resources :recipes, only: [:show, :index, :new, :create, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foods
  resources :public_recipes, only: %i[index]
  # Defines the root path route ("/")
  # root "articles#index"
end
