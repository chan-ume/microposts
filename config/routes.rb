Rails.application.routes.draw do
  root to: 'static_pages#home'
  get 'signup', to: 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  resources :users do
    member do
      get 'following'
      get 'followed'
      get 'favorite'
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts do
    member do
      get 'favoriteuser'
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
end
