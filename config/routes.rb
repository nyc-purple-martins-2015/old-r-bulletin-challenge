RBulletin::Application.routes.draw do
  resources :topics do
    resources :conversations
  end

  resources :conversations do
    resources :messages
  end

  resources :users

  get "register" => 'users#new'
  get "login" => 'sessions#new'
  post "login" => 'sessions#create'
  get "logout" => 'sessions#destroy'

  root 'topics#index'


end
