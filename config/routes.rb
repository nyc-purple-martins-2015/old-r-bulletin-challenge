RBulletin::Application.routes.draw do
  resources :categories do
    resources :topics
  end

end
