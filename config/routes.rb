Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'

  resources :items
  resources :users
  resources :purchases
  resources :addresses
  resources :credit_cards,only:[:new, :destroy, :show]


  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
end