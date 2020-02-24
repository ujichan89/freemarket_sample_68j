Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get  'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  root to: 'items#index'

  resources :users, except: [:index]
  resources :items, only: [:index, :new, :show, :edit, :update, :destroy ]
  resources :addresses
  resources :credit_cards

  resources :purchases, only: [:edit, :update] do
    collection do
      # get 'index', to: 'purchase#index'
      get 'edit', to: 'purchases#edit'
      post 'pay', to: 'purchases#pay'
      get 'done', to: 'purchases#done'

    end
  end

  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end


end

