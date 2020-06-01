# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  def index
    redirect_to users_top_path if user_signed_in?
  end
end
