class UserPreferencesController < ApplicationController
  before_action :authenticate_user!
  def create
    positions = params[:position_ids].reject{|po| po == ""}
    params[:preference_ids].each_with_index do |p_id, i|
      @user_preference = UserPreference.new(user: current_user, position: positions[i], preference: Preference.find(p_id))
      unless @user_preference.save
        flash[:danger] = "You have not created your profil preferences"
        redirect_to root_path
      end
    end
    flash[:notice] = "You have created your profil preferences correctly"
    redirect_to current_user
  end

  def new
    @preferences = Preference.all
  end
end
