Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :performances
  get 'dashboard', to: 'artists#show', as: 'artist_dashboard'
end
