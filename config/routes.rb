# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root 'articles#index'

  resources :articles do
    resources :comments
  end

  resources :users
end
