Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  #resources :users, only: [:]
  #resources :items, only: :index
  #resources :orders, only: [:index, :create]
end
