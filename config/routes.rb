Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'
  resources :performances do
    resources :attendance, only: [:create]
  end

  get 'dashboard', to: 'artists#show', as: 'artist_dashboard'
  resources :profiles, only: [ :show, :edit, :update ]

end
