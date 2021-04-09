Rails.application.routes.draw do
  get '/signup', to: 'users#new'
  get '/index', to: 'rooms#index'
  root 'rooms#home'
end
