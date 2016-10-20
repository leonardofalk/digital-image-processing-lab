Rails.application.routes.draw do
  resources :image_collections
  resources :images
  root to: 'home#index'
end
