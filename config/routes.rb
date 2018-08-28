Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  root to: 'pages#home'
  resources :performances do
    resources :attendance, only: [:create]
    resources :comment, only: [:create]
    resources :contributions, only: :create
  end

  resources :profiles, only: [ :show, :edit, :update ]
  # For creating a new contribution
  resources :contributions, only: [ :show ] do
    resources :payments, only: [:new, :create]
  end

  resources :users, only: [:edit, :update]
end
