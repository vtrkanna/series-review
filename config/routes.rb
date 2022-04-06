# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'series#index'
  get '/series/:id', to: 'series#show', as: :show_series
  get '/users/:id', to: 'users#show', as: :show_user
end
