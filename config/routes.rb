Rails.application.routes.draw do

  get "shifts/manage", to: "shifts#manage"
  resources :shifts


  resources :users

  resources :announcements, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  root "announcements#index"

end

