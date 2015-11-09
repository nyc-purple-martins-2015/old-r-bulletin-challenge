Rails.application.routes.draw do

  root 'topics#index'

  resources :topics, only: [:index, :show] do
    resources :conversations, except: [:index, :show]
  end

  resources :conversations, only: [:show] do
    resources :messages,  only: [:create]
  end


  # resources :messages, only: [:create, :new, :destroy]

  resources :users

  resource :session,  only: [:new, :create, :destroy]

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  # post ''
end
