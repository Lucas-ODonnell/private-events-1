# == Route Map
#

Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'events#index'
  resources :users, only: [:show]
  resources :events, only: [:index, :new, :create, :show, :edit, :update]
end
