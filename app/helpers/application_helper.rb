module ApplicationHelper

  def validated_user?
    unless current_user.status == "validated"
      redirect_to root_path
      flash[:danger] = "Please confirm your account before using any functionnalities"
    end

  end


end
