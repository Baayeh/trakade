Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :items
  resources :orders
  resources :items
end
