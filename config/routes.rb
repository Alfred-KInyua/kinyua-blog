# frozen_string_literal: true

Rails.application.routes.draw do
  resources :comments
  resources :users
  root 'pages#index'
  get 'about', to: 'pages#about'
  resources :articles

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
