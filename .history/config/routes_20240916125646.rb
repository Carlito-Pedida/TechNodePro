Rails.application.routes.draw do
  get "pages#index"
  
  get "/articles", to: "articles#index"
end
 