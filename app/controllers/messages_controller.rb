class MessagesController < ApplicationController
  before_action :authenticate_user!

  # GET /messages
  # GET /messages.json
  def index
    @conversation = Conversation.find(params[:conversation_id])
    @messages = Message.order(:created_at).where(conversation: @conversation)
    @other_user = @conversation.other_participant(current_user)
    respond_to do |format|
      format.html{redirect_to root_path }
      format.js{

      }
    end

  end
  # POST /messages
  # POST /messages.json
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(user: current_user, conversation_id: params[:conversation_id], content: params[:content])
    respond_to do |format|
      if @message.save
        format.html { redirect_to root_path }
        format.js {}
      else
        format.html { render root_path }
        format.js {}
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
end
