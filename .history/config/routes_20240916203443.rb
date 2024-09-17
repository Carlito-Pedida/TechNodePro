Rails.application.routes.draw do
  root "home#index"

  resources :articles do
    resources :comments
  end
end
