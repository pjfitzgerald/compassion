Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users do
    resources :chatrooms, only: [:show]
  end

  # add journal here?
end
