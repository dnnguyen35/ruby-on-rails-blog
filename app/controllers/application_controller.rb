# frozen_string_literal: true

# The ApplicationController is the base controller for the entire application.
# It provides common functionality and methods that are available to all other controllers.
class ApplicationController < ActionController::Base
  include Pagy::Backend

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
  end
end
