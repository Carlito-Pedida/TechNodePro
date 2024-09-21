Rails.application.routes.draw do
  root "page#index"
  get "about", to: "pages#about"

  get "signup", to: "users#new"
  resources :users, except: [ :new ]

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :articles do
    resources :comments
  end
end
