class FlatPicturesController < ApplicationController
  def create
  end

  def destroy
    ActiveStorage::Attachment.find(params[:pic]).purge
      respond_to do |format|
        format.html { redirect_to current_user, notice: 'Image was successfully destroyed.' }
        format.json { head :no_content }
      end
  end

  def update
  end
end
