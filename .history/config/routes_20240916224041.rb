Rails.application.routes.draw do
  root "home#index"
  get "about", to: "home#about"

  resources :articles do
    resources :comments
  end
end
