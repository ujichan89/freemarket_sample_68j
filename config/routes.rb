Rails.application.routes.draw do
  devise_for :users
  root to: 'goods#index'

  resources :users, only:[:new]
  resources :items
  resources :addresses
  resources :purchases
  resources :credit_cards

end