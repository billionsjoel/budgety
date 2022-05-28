Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "splash#index"

  resources :splash, only: [:index]
  resources :categories do
    resources :purchases
  end

  resources :users
end
