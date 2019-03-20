class Admins::ApplicationController < ApplicationController
  before_action :is_admin?

  private
  def is_admin?
    unless current_user.is_admin == true
      flash[:danger] = "You are not an admin "
      redirect_back(fallback_location: root_path)
    end
  end

end
