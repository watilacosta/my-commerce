# frozen_string_literal: true

Rails.application.routes.draw do
  root 'store_front/home#index'
  post 'auth/login'
  post 'auth/sign_up'
  post 'auth/confirm_user_access'

  namespace :admin do
    resources :products, except: %i[new edit]
    resources :brands, except: %i[new edit]
    resources :categories, except: %i[new edit]
    resources :users, only: :index
  end
end
