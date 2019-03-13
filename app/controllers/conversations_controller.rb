class ConversationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_conversation, only: [:destroy]

  # GET /conversations
  def index
    @conversations = Conversation.all.select{|c| c.participants.include?(current_user)}
  end

  def create
    @conversation = Conversation.new(conversation_params)

    respond_to do |format|
      if @conversation.save
        format.html { redirect_to root_path }
        format.js {}
      else
        format.html { render root_path}
        format.js {}
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
