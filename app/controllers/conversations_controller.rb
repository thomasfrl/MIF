class ConversationsController < ApplicationController
  before_action :authenticate_user!

  # GET /conversations
  def index
    @conversations = Conversation.sort_by_last_message.select{|c| c.participants.include?(current_user)}
    unless @conversations.empty?
      @conversation = @conversations.first
      @messages = Message.order(:created_at).where(conversation: @conversation)
      @other_user = @conversation.other_participant(current_user)
    end
    @conversation_new = Conversation.new
    @users = User.all.reject{|u| u == current_user}
end

  #IMPORTANT!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  #IL FAUDRA SUPPRIMER CETTE MÉTHODE ET PEUT ETRE TOUTES CELLES EN DESSSOUS
  #MAIS PAS TOUT DE SUITE
  #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  def create
    @other_user = User.find(params[:conversation][:receiver_id])
    @conversation = Conversation.new(receiver: @other_user, author: current_user)
    if Conversation.where(author: current_user, receiver: @other_user).empty? && Conversation.where(author: @other_user, receiver: current_user).empty?
      respond_to do |format|
        if @conversation.save
          @messages = @conversation.messages

          format.html { redirect_to root_path }
          format.js {}
        else
          format.html { redirect_to root_path}
          format.js {redirect_to root_path}
        end
      end
    else
      if Conversation.where(author: current_user, receiver: @other_user).empty?
        @conversation  = Conversation.where(author: @other_user, receiver: current_user)
      else
        @conversation  = Conversation.where(author: current_user, receiver: @other_user)
      end
      @messages = Message.order(:created_at).where(conversation: @conversation)

      respond_to do |format|
        format.html { redirect_to root_path }
        format.js{render "messages/index"}
      end
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
