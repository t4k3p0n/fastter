Rails.application.routes.draw do

  get 'posts/index'
  get 'posts/allpost'
  get 'posts/show'

  get 'users/top'
  get 'top/show'

  root 'home#index'

  post '/users/guest_sign_in', to: 'users#new_guest'
  post "posts/:id/destroy" => "posts#destroy"
  devise_for :users
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    post 'login', to: 'devise/sessions#create'
    delete 'signout', to: 'devise/sessions#destroy'
  resources :users, :only => [:show]
  resources :top, :only => [:index]
  resources :posts, only: [:index, :show, :create]
  resources :relationships,only: [:create, :destroy]
  resources :comments, only: [:create,:destroy]
  end

  
  resources :users do
    member do
     get :following, :followers
    end
  end

end
