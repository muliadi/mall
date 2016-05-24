Rails.application.routes.draw do
  devise_for :users
  resources :shops
  resources :categories

  resources :items do
    collection do
      get :search
    end
  end

  get "seller", to: "items#seller"

  root 'home#index'
end
