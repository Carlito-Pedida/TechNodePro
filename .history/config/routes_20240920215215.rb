Rails.application.routes.draw do
  root "pages#home"
  get "about", to: "pages#about"
  get "blog", to: "pages#blog"
  get "tech-zone", to: "page#tech-zone"

  get "signup", to: "users#new"
  resources :users, except: [ :new ]

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :articles do
    resources :comments
  end
end
