class HomeController < ApplicationController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def index
    if user_signed_in?
      redirect_to users_top_path 
    end
  end
end
