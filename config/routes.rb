Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions" }
  root to: 'pages#home'
  resources :users do
    get "survey", to: "users#survey", as: :survey
  end
  resources :chatrooms, only: [:show] do
    resources :messages, only: [:create]
  end
end
