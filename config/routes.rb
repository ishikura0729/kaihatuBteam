Rails.application.routes.draw do

  resources :shifts

  resources :users

  resources :announcements, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  root "announcements#index"

end

