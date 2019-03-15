class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    conversations_controller
    comments_controller
    correspondances_controller
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_path(current_user.id), notice: 'User was successfully updated.' }
        format.json { render :edit, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :description, :age, :welcome_message, :city_id, :nationality)
    end

    def conversations_controller
      @conversations = Conversation.sort_by_last_message.select{|c| c.participants.include?(current_user)}
      @conversation = @conversations.first
      @messages = Message.order(:created_at).where(conversation: @conversation)
      @other_user = @conversation.other_participant(current_user)
      @conversation_new = Conversation.new
      @users = User.all.reject{|u| u == current_user}  
    end

    def comments_controller
      @sent_comments = current_user.authored_comments
      @received_comments = current_user.received_comments
      @comment = Comment.new  
    end

    def correspondances_controller
      @correspondances = current_user.correspondances
      @validated_correspondances = current_user.validated_correspondances
      @sent_correspondances = current_user.sent_correspondances
      @received_correspondances = current_user.waiting_correspondances
      @refused_correspondances = current_user.refused_correspondances
      @correspondance = Correspondance.new      
    end
end
