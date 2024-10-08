# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root to: 'dashboard#index'
  resources :dashboard, only: %i[index show]
end
