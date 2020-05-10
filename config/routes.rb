Rails.application.routes.draw do

  get 'users/top'
  get 'top/show'
  root 'home#index'
  post '/users/guest_sign_in', to: 'users#new_guest'
  devise_for :users
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    post 'login', to: 'devise/sessions#create'
    delete 'signout', to: 'devise/sessions#destroy'
  end
  resources :users, :only => [:show]
  resources :top, :only => [:index]
  resources :posts, only: [:index, :show, :create]
  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]

end
