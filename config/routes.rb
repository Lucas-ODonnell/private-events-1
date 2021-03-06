# frozen_string_literal: true

# == Route Map
#

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  authenticated :user do
    root to: 'users#show', as: :authenticated_root
  end

  root 'events#index'

  resources :users, only: %i[show]
  resources :events, only: %i[index new create show edit update]

  resources :invitations do
    collection do
      get :edit_multiple
      put :update_multiple
    end
  end
end
