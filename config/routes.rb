# frozen_string_literal: true

Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/allpost'
  get 'posts/show'

  get 'users/top'
  get 'top/show'

  get 'zozo/index'
  get 'zozo/woindex'

  root 'home#index'

  post '/users/guest_sign_in', to: 'users#new_guest'
  post 'posts/:id/destroy' => 'posts#destroy'
  devise_for :users
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    post 'login', to: 'devise/sessions#create'
    delete 'signout', to: 'devise/sessions#destroy'
    resources :users, only: [:show]
    resources :top, only: [:index]
    resources :notifications, only: [:index]
    resources :relationships, only: %i[create destroy]
    resources :comments, only: %i[create destroy]
  end
  resources :posts, only: %i[index show create] do
    resources :likes, only: %i[create destroy]
  end

  resources :users do
    member do
      get :following, :followers
    end
  end
end
