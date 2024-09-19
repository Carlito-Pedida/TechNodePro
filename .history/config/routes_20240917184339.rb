Rails.application.routes.draw do
  root "home#index"
  get "about", to: "home#about"

  get "signup", to: "users#new"
  post "users", to: "user#create"

  resources :articles do
    resources :comments
  end
end
