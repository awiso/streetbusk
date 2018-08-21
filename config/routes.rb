Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :performances
  resources :profiles, only: [ :show, :edit, :update ]
end
