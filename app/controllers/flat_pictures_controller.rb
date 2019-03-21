class FlatPicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :good_user

  def create
    image = MiniMagick::Image.new(params[:pictures].tempfile.path)
    image.resize "500x300\!"
    image.format "png"
    @flat.pictures.attach(io: File.open(image.path), filename: image.path.slice(5...image.path.length))
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
    @flat = Flat.find(params[:flat_id])
    if current_user != @flat.user
      flash[:danger] = "You can not modify the picture of another user flat"
      redirect_to root_path
    end
  end

end
