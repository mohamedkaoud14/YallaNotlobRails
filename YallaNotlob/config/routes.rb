Rails.application.routes.draw do
  # devise_for :users, controllers: {omniauth_callabacks: 'omniauth'}
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth' }
  
  # get 'auth/facebook/callback'

  # devise_for :users, skip: :all
  # # devise_for :users, controllers: { sessions: 'users/sessions' }
  # devise_for :users, path: 'auth', path_names: { sign_in: 'login', sign_out: 'cmon_let_me_in', 
  # password: 'secret', confirmation: 'verification', unlock: 'unblock', 
  # registration: 'register', sign_up: 'cmon_let_me_in' }
  # root "groups#index"
 
  # devise_scope :user do
  #   get 'sign_in', to: 'devise/sessions#new'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
# end


