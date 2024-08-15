Rails.application.routes.draw do
  get 'libraries/create'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

  resources :books do
    resources :comments, only: [:create]
    post 'add_to_library', to: 'libraries#create'
  end

  resources :authors
  resources :users, :only => [:show, :update, :destroy]

  namespace :settings do
    get 'profile', to: 'user_settings#show_profile'
    get 'account', to: 'user_settings#show_account'
    get 'appearance', to: 'user_settings#show_appearance'
    get 'notifications', to: 'user_settings#show_notifications'
    get 'emails', to: 'user_settings#show_emails'
    get 'password', to: 'user_settings#show_password'
  end

  if Rails.env.development?
    mount Lookbook::Engine, at: "/lookbook"
  end

  root 'pages#index'
end

