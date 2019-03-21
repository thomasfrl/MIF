class FlatPicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :good_user

  def create
    @flat.pictures.attach(params[:pictures])
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
