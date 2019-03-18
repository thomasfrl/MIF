class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :configure_devise_parameters, if: :devise_controller?
  before_action :correspondances_controller, if: :user_signed_in?

  private
  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up){|u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :user_name, :city_id)}
  end

  def correspondances_controller
    @correspondances = current_user.correspondances
    @validated_correspondances = current_user.validated_correspondances
    @sent_correspondances = current_user.sent_correspondances
    @received_correspondances = current_user.waiting_correspondances
    @refused_correspondances = current_user.refused_correspondances
    @correspondance = Correspondance.new
  end

end
