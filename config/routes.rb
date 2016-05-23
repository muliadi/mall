Rails.application.routes.draw do
  devise_for :users
  resources :shops
  resources :categories

  resources :items do
    collection do
      get :search
    end
  end


  root 'home#index'
end
