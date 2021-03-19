Rails.application.routes.draw do
  # devise_for :users
  # # devise_for :users
  devise_for :users, skip: :all
  # devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'cmon_let_me_in', 
  password: 'secret', confirmation: 'verification', unlock: 'unblock', 
  registration: 'register', sign_up: 'logout' }
  root "groups#index"
 
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new'
  end
end
