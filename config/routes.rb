Rails.application.routes.draw do

  get 'users/top'
  devise_for :users
  root 'home#index'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
    post 'login', to: 'devise/sessions#create'
    delete 'signout', to: 'devise/sessions#destroy'
  end
  
end
