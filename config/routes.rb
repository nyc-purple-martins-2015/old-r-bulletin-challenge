Rails.application.routes.draw do
  resources :topics do
    resources :conversations
  end

  resources :conversations do
    resources :messages
  end

  root 'topics#index'
end

