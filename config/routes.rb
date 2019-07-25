Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions" }
  root to: 'pages#home'
  resources :users
  get "survey", to: "users#survey", as: :survey
  resources :chatrooms, only: [:show] do
    resources :messages, only: [:create]
  end
  get "customize_user", to: "profiles#new", as: :profile_choose
end
