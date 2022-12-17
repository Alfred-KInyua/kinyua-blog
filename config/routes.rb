# frozen_string_literal: true

Rails.application.routes.draw do
  get 'pages/index', to: 'pages#index'
  get 'pages/about', to: 'pages#about'
  resources :articles

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'articles#index'
end
