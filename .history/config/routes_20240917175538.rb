Rails.application.routes.draw do
  root "home#index"
  get "about", to: "home#about"

  get "signup" to: "user#new"

  resources :articles do
    resources :comments
  end
end
