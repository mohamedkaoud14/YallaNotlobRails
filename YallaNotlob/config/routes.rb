Rails.application.routes.draw do
  # devise_for :users, controllers: {omniauth_callabacks: 'omniauth'}
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth' } 
  # get 'auth/facebook/callback'
  root "groupusers#index"
  post "/groupusers/new" , to: "groupusers#new"
  get "/groupusers/new" , to: "groupusers#new"
    post "/groupusers/create" , to: "groupusers#create"
  get "/groupusers/create" , to: "groupusers#create"
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
    #  post '/users/auth/google_oauth2', to:'devise/oomniauth#google_oauth2'
    #   get '/users/auth/google_oauth2', to:'devise/omniauth_callbacks#google_oauth2'

 
  end
end
# end
