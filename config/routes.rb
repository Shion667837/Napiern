Rails.application.routes.draw do
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'

  get '/index', to: 'posts#index'
  get 'posts/new', to: 'posts#new'
  get 'posts/search', to: 'posts#search'
  get 'posts/post_ranking', to: 'posts#post_ranking'
  get 'posts/week_ranking', to: 'posts#week_ranking'
  get 'posts/month_ranking', to: 'posts#month_ranking'
  get 'posts/:id', to: 'posts#show'
  post 'posts/create', to: 'posts#create'
  delete 'posts/destroy', to: 'posts#destroy'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/favorites/index', to: 'favorites#index'
  root 'posts#home'

  resources :users

  resources :companies do
    collection do
      get 'home'
    end
    resource :favorites, only: [:create, :destroy]
  end

  resources :posts, only: [:create, :destroy] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
end
