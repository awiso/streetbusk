Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'
  resources :performances
  get 'dashboard', to: 'artists#show', as: 'artist_dashboard'
  resources :profiles, only: [ :show, :edit, :update ]
  # For creating a new contribution
  resources :contributions, only: [ :show, :create ] do
    resources :payments, only: [:new, :create]
  end
end
