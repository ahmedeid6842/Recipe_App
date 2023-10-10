Rails.application.routes.draw do
  devise_for :users

  root "foods#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :foods

  # Defines the root path route ("/")
  # root "articles#index"
end
