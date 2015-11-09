Rails.application.routes.draw do
  resources :topics do
    resources :conversations
  end

  resources :conversations do
    resources :messages
  end

  resource :session, only: [:create, :new, :destroy]
  resources :users, only: [:create, :new]


  # get 'register' :'users#new'

  root 'topics#index'
end

