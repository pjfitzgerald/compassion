Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations", sessions: "sessions" }
  root to: 'pages#home'
  resources :users do
    get "survey", to: "users#survey", as: :survey
    resources :matches do
      resources :chatrooms, only: [:show]
    end
  end
end
