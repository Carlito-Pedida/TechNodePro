Rails.application.routes.draw do
  root "home#index"
  get "about", to: "home#about"

  get "signup", to: "users#user_new"

  resources :articles do
    resources :comments
  end
end
