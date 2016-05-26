Rails.application.routes.draw do

  resources :orders
  devise_for :users, controllers: {sessions: "sessions", registrations: "registrations"}
  resources :shops
  resources :categories
  resources :users

  resources :items do
    collection do
      get :search
    end
  end

  get "seller", to: "items#seller"

  get "/users", to: "users#show", as: :user_root

  root 'home#index'
end
