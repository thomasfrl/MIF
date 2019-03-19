class UserPicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :good_user

  def create
    @user.pictures.attach(params[:pictures])
    redirect_to current_user, notice: 'Image was successfully uploaded.'
  end

  def destroy
    ActiveStorage::Attachment.find(params[:pic]).purge
      respond_to do |format|
        format.html { redirect_to current_user, notice: 'Image was successfully destroyed.' }
      end
  end

  private
  def good_user
    @user = User.find(params[:user_id])
    if current_user != @user
      flash[:danger] = "You can not modify the picture of another user"
      redirect_to root_path
    end
  end
end
