Rails.application.routes.draw do
  root "home#index"
  
  get "/articles", to: "articles#index"
end
 