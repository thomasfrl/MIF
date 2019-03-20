class AvatarsController < ApplicationController
  require 'open-uri'
  def create
    @user = User.find(current_user.id)
  
    image = MiniMagick::Image.new(params[:avatar].tempfile.path)
    image.resize "500x500\!"
    image.format "png"
    @user.avatar.attach(io: File.open(image.path), filename: image.path.slice(5...image.path.length))
    redirect_to(user_path(@user))

  end
end
