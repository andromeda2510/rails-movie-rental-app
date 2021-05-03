class ApplicationController < ActionController::Base
  include Pundit

  protect_from_forgery with: :exception
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    permissions = proc do |user|
      user.permit(:name,
                  :email,
                  :password,
                  :password_confirmation,
                  :current_password)
    end

    devise_parameter_sanitizer.permit(:sign_up, &permissions)
    devise_parameter_sanitizer.permit(:account_update, &permissions)
  end
end
