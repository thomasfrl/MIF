class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation, only: [:destroy]

  # GET /conversations
  def index
    @conversations = Conversation.sort_by_last_message.select{|c| c.participants.include?(current_user)}
    @conversation = Conversation.new
    @users = User.all.reject{|u| u == current_user}
  end

  def create
    @receiver = User.find(params[:conversation][:receiver_id])
    @conversation = Conversation.new(receiver: @receiver, author: current_user)
    if Conversation.where(author: current_user, receiver: @receiver).empty? && Conversation.where(author: @receiver, receiver: current_user).empty?
      respond_to do |format|
        if @conversation.save
          format.html { redirect_to root_path }
          format.js {}
        else
          format.html { redirect_to root_path}
          format.js {redirect_to root_path}
        end
      end
    else 
      puts "jkjkjjkkjjkkjkjkjkj"*10
    end
  end


  # DELETE /conversations/1
  # DELETE /conversations/1.json
  def destroy
    @conversation.destroy
    respond_to do |format|
      format.html { redirect_to conversations_url, notice: 'Conversation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversation_params
      params.require(:conversation).permit(:user_one_id, :user_two_id)
    end
end
