Rails.application.routes.draw do
  root "pages#index"
  
  get "/articles", to: "articles#index"
end
 