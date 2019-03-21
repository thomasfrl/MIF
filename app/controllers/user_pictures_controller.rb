class UserPicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :good_user

  def create
    image = MiniMagick::Image.new(params[:pictures].tempfile.path)
    image.resize "500x300\!"
    image.format "png"
    @user.pictures.attach(io: File.open(image.path), filename: image.path.slice(5...image.path.length))
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
