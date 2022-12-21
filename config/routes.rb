# frozen_string_literal: true

Rails.application.routes.draw do
  post 'auth/login'

  resources :products
  resources :brands
  resources :categories

  namespace :administration do
    resources :users
  end
end
