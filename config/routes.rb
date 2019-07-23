Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :users do
    resources :matches do
      resources :chatrooms, only: [:show]
    end
  end

  # add journal here?
end
