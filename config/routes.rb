Rails.application.routes.draw do
  resources :topics do
    resources :conversations
  end

  resources :conversations do
    resources :messages
  end

  resources :sessions, only: [:create, :destroy]
  resources :users, only: [:create, :new]


  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'


  root 'topics#index'
end

