Rails.application.routes.draw do
  get 'homepage/index'
  resources :orders do
    collection do
      get 'summary'
      post 'confirm'
    end
  end
  get '/admin_account/:id', to: "admin_accounts#index", as: "admin_account"
  get '/dashboard', to: "dashboard#index"
  # Defines the root path route ("/")
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }, skip: [ :passwords, :confirmations, :unlocks, :omniauth_callbacks]

  get '*others', to: "homepage#index"

  root "homepage#index"
end
