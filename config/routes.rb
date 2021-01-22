# == Route Map
#

Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  authenticated :user do
    root to: 'users#show', as: :authenticated_root
  end
  
  root 'events#index'

  resources :users, only: [:show]
  resources :events, only: [:index, :new, :create, :show, :edit, :update]
  resources :invitations, only: [:index, :show, :edit, :update]
end
