Rails.application.routes.draw do
  get 'homes/index'
  get 'reservations/index'
  get 'rooms/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'users/index'
  root to: 'homes#index'
  resources :users do
    collection do
      get 'account'
      get 'profile'
    end
  end
  resources :rooms do
    collection do
      get 'posts'
      get 'search'
    end
  end
  resources :reservations do
    collection do
      post 'confirm'
    end
  end
end
