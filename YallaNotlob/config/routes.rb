Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth' }
  get "/friends/search", to: "friends#search"
  resources :friends
  root "friends#index"
   
  # resources :friends
 
  # get "/friends/:id", to: "friends#index"
   delete "/friends/:id", to: "friends#destroy"
   
  
  
  
  devise_scope :user do
    get "/users/sign_out", to:"devise/sessions#destroy" 
    
 
  end

end

# <%= link_to "unfriend", "/friends/#{fri.friend_id}" ,

# method: :delete,
# data: { confirm: "Are you sure you want to unfriend him?" } %>

# <%= link_to "unfriend", "/friends/" ,
#                   method: :delete,
#                   data: { confirm: "Are you sure you want to unfriend him?" } %>
