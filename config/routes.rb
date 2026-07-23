Rails.application.routes.draw do

  root to: 'sessions#new'

  get 'sessions/new'
  delete "logout", to: "sessions#destroy"
  get "login" , to: "sessions#new"
  post "login",to: "sessions#create"

  get "shifts/manage", to: "shifts#manage"
  resources :users
  resources :shifts
  resources :announcements, only: [:index, :show, :new, :create, :edit, :update, :destroy]


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

end

