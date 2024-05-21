Rails.application.routes.draw do
<<<<<<< HEAD
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
=======
  post 'signup', to: 'users#create'
  post 'auth/login', to: 'authentication#login'
  resources :transactions, only: [:create, :index, :show, :update]
>>>>>>> 16b87d6 (feat create project test for id2)
end
