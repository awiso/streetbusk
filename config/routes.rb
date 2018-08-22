Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :performances
  get 'dashboard', to: 'artists#show', as: 'artist_dashboard'
  resources :profiles, only: [ :show, :edit, :update ]
  # For creating a new contribution
  resources :contributions, only: [ :create ]
end
