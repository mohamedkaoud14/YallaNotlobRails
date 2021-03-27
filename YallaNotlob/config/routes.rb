Rails.application.routes.draw do
  root 'pages#myaccount'
  # devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth' }
  get "/friends/search", to: "friends#search"
  resources :friends
   delete "/friends/:id", to: "friends#destroy"
  devise_scope :user do
    get "/users/sign_out", to:"devise/sessions#destroy"  
  end
    resource :groupusers
    resource :omniauth
   resource :orders
   delete "/groupusers/delete/:id" , to: "groupusers#destroy"
   post "/groupusers/new" , to: "groupusers#new"
   get "/groupusers/new" , to: "groupusers#new"

    post "/groupusers/add" , to: "groupusers#add"
   get "/groupusers/add" , to: "groupusers#add"
     delete "/groupusers/edit" , to: "groupusers#edit"
        #  delete"/groupusers/edit/:delfriend_id" , to: "groupusers#edit"
     post "/orders/new" , to: "groupusers#new"
     post "/orders/new" , to: "groupusers#new"
   get "/orders/new" , to: "groupusers#new"

   post "/orders/show" , to: "orders#show"
   get "/orders/show" , to: "orders#show"

     post "/groupusers/create" , to: "groupusers#create"
   get "/groupusers/create" , to: "groupusers#create"  
      post '/users/auth/google_oauth2', to: "omniauth#google_oauth2"
       get '/users/auth/google_oauth2', to: "omniauth#google_oauth2"
         post '/users/auth/facebook', to: "omniauth#facebook"
       get '/users/auth/facebook', to: "omniauth#facebook"


       post "/orders/new/:friendd_id" , to: "orders#new"
   get "/orders/new/:friendd_id" , to: "orders#new"
 

  
  
 
 
  
end

# <%= link_to "unfriend", "/friends/#{fri.friend_id}" ,

# method: :delete,
# data: { confirm: "Are you sure you want to unfriend him?" } %>

# <%= link_to "unfriend", "/friends/" ,
#                   method: :delete,
#                   data: { confirm: "Are you sure you want to unfriend him?" } %>


# <div class="field">
    
#     <% if resource.avatar.attached?  %>

#     <%= image_tag(resource.avatar) %>

#     <% else  %>
#     <%= image_tag("/default.jpeg") %>
    
#     <% end %>
#   </div>