# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get '/users/edit_password/:id', to: 'users/registrations#edit_password', as: 'edit_password'
    patch '/users/update_password/:id', to: 'users/registrations#update_password', as: 'update_password'
  end

  root 'articles#index'

  resources :articles do
    resources :comments
  end

  resources :users
end
