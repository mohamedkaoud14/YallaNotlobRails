Rails.application.routes.draw do
  # devise_for :users
  # devise_for :users, controllers: {omniauth_callabacks: 'omniauth'}
  # root 'groupusers/#index'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth' } 
  # get 'auth/facebook/callback'
  # delete "/groupusers/:id" , to: "groupusers#destroy"
  resource :groupusers
   resource :omniauth
  delete "/groupusers/delete/:id" , to: "groupusers#destroy"
  root "groupusers#index"
  post "/groupusers/new" , to: "groupusers#new"
  get "/groupusers/new" , to: "groupusers#new"
  #  post "/groupusers/edit" , to: "groupusers#edit"
  # get "/groupusers/edit" , to: "groupusers#edit"
    # post "/groupusers/show" , to: "groupusers#show"
    # get "/groupusers/show" , to: "groupusers#show"
    post "/groupusers/create" , to: "groupusers#create"
  get "/groupusers/create" , to: "groupusers#create"

  #  get "/groupusers/:id" , to: "groupusers#destroy"


 
  

  
     post '/users/auth/google_oauth2', to: "groupusers#new"
      get '/users/auth/google_oauth2', to: "groupusers#new"
  # resources :groupusers

  # devise_for :users, skip: :all
  # # devise_for :users, controllers: { sessions: 'users/sessions' }
  # devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'cmon_let_me_in', 
  # password: 'secret', confirmation: 'verification', unlock: 'unblock', 
  # registration: 'register', sign_up: 'cmon_let_me_in' }
  # root "groups#index"
 
  # devise_scope :user do
  #   get 'sign_in', to: 'devise/sessions#new'
  devise_scope :user do
    get "/users/sign_out", to:"devise/sessions#destroy" 

    #   get '/users/auth/google_oauth2', to:'devise/omniauth_callbacks#google_oauth2'

 
  end
end
# end
