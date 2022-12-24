# frozen_string_literal: true

Rails.application.routes.draw do
  post 'auth/login'

  resources :products
  resources :brands
  resources :categories

  namespace :admin do
    resources :users
  end
end
