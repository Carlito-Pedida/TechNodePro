Rails.application.routes.draw do
  root "/"

  resources :articles do
    resources :comments
  end
end
