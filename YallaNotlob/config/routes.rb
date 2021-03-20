Rails.application.routes.draw do
  # devise_for :users
  root "orders#index"
  # resources :orders
  post "/orders", to: "orders#create"
  get "/orders", to: "orders#create" 
 
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
