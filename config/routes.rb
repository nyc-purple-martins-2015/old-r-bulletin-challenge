Rails.application.routes.draw do

  root 'topics#index'

  resources :topics, only: [:index, :show] do
    resources :conversations, except: [:index]
  end

  resources :messages, only: [:create, :new, :destroy]

  resources :users

end
