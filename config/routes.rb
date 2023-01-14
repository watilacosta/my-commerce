# frozen_string_literal: true

Rails.application.routes.draw do
  root 'store_front/home#index'
  post 'auth/login'
  post 'auth/sign_up'
  post 'auth/confirm_user_access'

  namespace :admin do
    resources :products
    resources :brands
    resources :categories, only: %i[index create update]
    resources :users, only: :index
  end
end
