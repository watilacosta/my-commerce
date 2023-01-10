# frozen_string_literal: true

Rails.application.routes.draw do
  root 'store_front/home#index'
  post 'auth/login'

  namespace :admin do
    resources :products
    resources :brands
    resources :categories, only: :create
    resources :users
  end
end
