Rails.application.routes.draw do
  get 'sessions/new'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "login" , to: "sessions#new"
  post "login",to: "sessions#create"
  resources :users
  resources :announcements, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :shifts

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :announcements, only: [:index, :show, :new, :create, :edit,:update,:destroy]

end

