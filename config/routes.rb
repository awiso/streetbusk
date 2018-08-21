Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :performances
<<<<<<< HEAD
  get 'dashboard', to: 'artists#show', as: 'artist_dashboard'
=======
  resources :profiles, only: [ :show, :edit, :update ]
>>>>>>> eb4dd3d60f5768d4b7ec8733e960f86adc4fa74d
end
