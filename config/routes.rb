Rails.application.routes.draw do
  get 'credit_cards/index'
  root to: 'goods#index'
end