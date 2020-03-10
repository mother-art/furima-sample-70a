Rails.application.routes.draw do
  devise_for :users
  root "posts#index"
  resources :posts
  resources :users
  resources :products 
  resources :ad
  resources :comments
end
