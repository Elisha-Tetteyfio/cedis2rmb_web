Rails.application.routes.draw do
  get 'homepage/index'
  resources :orders
  get '/admin_account/:id', to: "admin_accounts#index"
  get '/dashboard', to: "dashboard#index"
  # Defines the root path route ("/")
  devise_for :users, controllers: {
    sessions: 'users/sessions',
  }, skip: [ :passwords, :confirmations, :unlocks, :omniauth_callbacks]

  root "homepage#index"
end
