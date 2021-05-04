Rails.application.routes.draw do


  post 'rooms/:id/reservations/confirm', to: 'reservations#confirm'
  post 'reservations/create', to: 'reservations#create'

  get '/index', to: 'rooms#index'
  get 'rooms/new', to: 'rooms#new'
  get 'rooms/search', to: 'rooms#search'
  get 'rooms/:id', to: 'rooms#show'
  post 'rooms/create', to: 'rooms#create'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  root 'rooms#home'

  resources :users
  resources :rooms
  resources :reservations

  resources :rooms do
    resources :reservations
  end

end
