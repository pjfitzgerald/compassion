Rails.application.routes.draw do
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions" }
  root to: 'pages#home'
  resources :users
  get "survey", to: "users#survey", as: :survey
  resources :chatrooms, only: [:show, :destroy] do
    resources :messages, only: [:create]
  end

  get "customize_user", to: "profiles#new", as: :profile_choose

  get "new_chat", to: "users#new_match", as: :new_chat

  get "ongoing_chats", to: "users#ongoing_chats", as: :ongoing_chats

  mount ActionCable.server => "/cable"

  resources :journals do
    resources :posts
  end
end
