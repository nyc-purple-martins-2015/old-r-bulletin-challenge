Rails.application.routes.draw do
  resources :topics do
    resources :conversations do
      resources :messages
    end
  end
  root 'topics#index'
end

