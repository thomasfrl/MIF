class UserPreferencesController < ApplicationController
  before_action :authenticate_user!
  def create
    UserPreference.where(user: current_user).destroy_all
    positions = params[:position_ids].reject{|po| po == ""}
    params[:preference_ids].each_with_index do |p_id, i|
      @user_preference = UserPreference.new(user: current_user, position: positions[i], preference: Preference.find(p_id))
      unless @user_preference.save
        flash[:danger] = "You have not created your profil preferences"
        redirect_to root_path
      end
    end
    
    budget = params[:preference][:budget]
    current_user.update(budget_id: budget)
    flash[:notice] = "You have created your profil preferences correctly"
    redirect_to current_user
  end

  def new
    @budgets = Budget.all
    @preferences = Preference.all
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js {}
    end
  end
end
