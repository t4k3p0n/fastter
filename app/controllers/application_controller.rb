# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, only: :top

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username image])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username image])
  end

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    users_top_path
  end

  def after_sign_out_path_for(_resource)
    root_path
  end

  add_flash_types :success, :info, :warning, :danger
  protect_from_forgery with: :exception
end
