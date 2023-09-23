Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :comments
  resources :authors
  resources :users, :only => [:show]

  root 'pages#index'
end

