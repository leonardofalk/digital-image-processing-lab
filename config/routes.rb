Rails.application.routes.draw do
  resources :image_collections
  resources :images do
    member do
      get :show_image
    end
  end
  root to: 'home#index'
end
