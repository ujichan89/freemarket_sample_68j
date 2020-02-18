Rails.application.routes.draw do
  root to: 'items#index'

  resources :items
  resources :users
  resources :credit_cards

end