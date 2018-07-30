Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home/index'

  resources :sessions
  get 'login' => 'sessions#new', as: :login
  match 'logout' => 'sessions#destroy', as: :logout, via: :all

  resources :batches do
    get :latest_code, on: :collection
  end
  resources :states do
    get :front_page, on: :collection
  end
  resources :vessels do
    get :free, on: :collection
  end
  resources :measurements
  resources :additions
  resources :units
  resources :rackings
  resources :users
  resources :additives
  resources :sources
  resources :properties

  root to: 'home#index'
end
