Rails.application.routes.draw do
  resources :users, only: %i[create]
  post '/login', to: 'users#login'
  resources :payments, only: [:create, :index, :show, :update]
end
