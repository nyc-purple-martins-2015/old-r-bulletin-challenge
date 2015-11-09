RBulletin::Application.routes.draw do
    resources :topics do
      resources :conversations
  end
  root 'topics#index'
end
