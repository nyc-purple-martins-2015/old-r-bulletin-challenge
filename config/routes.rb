Rails.application.routes.draw do
  resources :topics do
    resources :conversations
  end

  resources :conversations do
    resources :messages
  end

  resources :sessions, only: [:create, :destroy]
  resources :users, only: [:new]

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'


  root 'topics#index'
end

