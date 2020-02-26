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
  
  resources :items do
    collection do
      get 'search'
    end
  end
  resources :addresses

  resources :purchases, only: [:edit] do
    collection do
      post 'pay', to: 'purchases#pay'
      get 'done', to: 'purchases#done'

    end
  end

  resources :cards, only: [:new, :show, :destroy] do
    collection do
      post 'pay', to: 'cards#pay'
    end
  end
end

