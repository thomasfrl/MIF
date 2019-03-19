class UserPreferencesController < ApplicationController
  before_action :authenticate_user!
  def create
    @user_preference = UserPreferences.new(user: current_user) #miss parameters
  end

  def new
    @preferences = Preference.all
    @user_preference = UserPreference.new
  end
end
