Rails.application.routes.draw do
  devise_for :users
  root to: 'purchases#edit'

  resources :users, only:[:new]
  resources :items
  resources :addresses
  resources :purchases, only:[:edit]
  resources :credit_cards

end