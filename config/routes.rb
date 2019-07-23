Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: 'pages#home'
  resources :users do
    resources :chatrooms, only: [:show]
    get "survey", to: "users#survey", as: :survey
  end
  # add journal here?
end
