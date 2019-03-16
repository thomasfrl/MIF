class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :configure_devise_parameters, if: :devise_controller?

  private
  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up){|u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :user_name, :city_id)}
  end

end
