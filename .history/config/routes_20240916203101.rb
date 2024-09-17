Rails.application.routes.draw do
  root "pages#index"

  resources :articles do
    resources :comments
  end
end
