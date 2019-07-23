Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users do
    resources :chatrooms, only: [:show]
  end

  namespace :user do
      root :to => "pages#survey"
  end
  # add journal here?
end
