# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'omni_auth'
  }
  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_up', to: 'users/registrations#new'
    get 'forgot_password', to: 'users/passwords#new'
    get 'reset_password', to: 'users/passwords#edit'
  end

  # get '/search' => 'movies#search'
  resources :movies, only: [:index, :show] do
    get :search, on: :collection
  end

  get '/home' => 'application#home'

  get '/metric' => 'metrics#home'

  root to: 'movies#index'
end
