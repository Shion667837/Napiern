Rails.application.routes.draw do
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'

  get '/index', to: 'posts#index'
  get '/companies', to: 'companies#index'
  get 'posts/new', to: 'posts#new'
  get 'posts/search', to: 'posts#search'
  get 'posts/post_ranking', to: 'posts#post_ranking'
  get 'posts/week_ranking', to: 'posts#week_ranking'
  get 'posts/month_ranking', to: 'posts#month_ranking'
  get 'posts/:id', to: 'posts#show'
  post 'posts/create', to: 'posts#create'
  get 'posts/:id/edit', to: 'posts#edit'
  post 'posts/:id/update', to: 'posts#update'
  delete 'posts/destroy', to: 'posts#destroy'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/favorites/index', to: 'favorites#index'
  root 'posts#home'
  get 'about', to: 'posts#about'

  resources :users

  resources :companies do
    collection do
      get 'home'
    end
    resource :favorites, only: [:create, :destroy]
  end

  resources :users do
    member do
      get :following, :followers
      get :likes
    end
  end

  resources :posts, only: [:create, :destroy, :new, :edit, :update] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]
end
