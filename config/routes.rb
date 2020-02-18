Rails.application.routes.draw do
  devise_for :users
  get 'credit_cards/index'
  root to: 'goods#index'
end