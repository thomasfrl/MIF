class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :configure_devise_parameters, if: :devise_controller?
  before_action :correspondances_controller, if: :user_signed_in?

  private
  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up){|u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :city_id)}
  end

  def correspondances_controller
    @received_correspondances = current_user.waiting_correspondances
  end
end
