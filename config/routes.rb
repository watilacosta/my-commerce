# frozen_string_literal: true

Rails.application.routes.draw do
  root 'store_front/home#index'
  post 'auth/login'
  post 'auth/sign_up'
  post 'auth/confirm_user_access'

  namespace :admin do
    resources :products, only: %i[index]
    resources :brands, only: %i[index]
    resources :categories, only: %i[create update index]
    resources :users, only: [:index, :edit]
  end

  namespace :store_front do
    resources :orders, only: [:create]
  end
end
