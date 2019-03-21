class Admins::UsersController < Admins::ApplicationController
  before_action :set_user, only: [ :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end


  # PATCH/PUT /users/1
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admins_users_path, notice: 'User was successfully updated.' }
      else
        flash.now[:danger] = "User was not successfully updated"
        format.html { redirect_to admins_users_path, notice: 'User was not successfully updated.' }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:status, :is_admin)
    end
end
