class FlatPicturesController < ApplicationController
  def create
    @flat = Flat.find(params[:flat_id])
    @flat.pictures.attach(params[:pictures])
    redirect_to current_user, notice: 'Image was successfully uploaded.'
  end

  def destroy
    ActiveStorage::Attachment.find(params[:pic]).purge
      respond_to do |format|
        format.html { redirect_to current_user, notice: 'Image was successfully destroyed.' }
      end
  end

  def update


  end
end
