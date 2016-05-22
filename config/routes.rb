Rails.application.routes.draw do
  resources :shops
  resources :categories

  resources :items do
    collection do
      get :search
    end
  end


  root 'home#index'
end
