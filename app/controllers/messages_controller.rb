class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :participant?, only: [:create, :index]
  before_action :in_a_correspondance?, only: [:create, :index]

  # GET /messages
  def index
    @conversation = Conversation.find(params[:conversation_id])
    @messages = Message.order(:created_at).where(conversation: @conversation)
    @other_user = @conversation.other_participant(current_user)
    respond_to do |format|
      format.html{redirect_to root_path }
      format.js{}
    end
  end

  # POST /messages
  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.new(user: current_user, conversation_id: params[:conversation_id], content: params[:content])
    respond_to do |format|
      if @message.save
        if @conversation.messages.size == 1
          current_user.update(token: current_user.token + 5)
        end
        format.html { redirect_to root_path }
        format.js {}
      else
        format.html { render root_path }
        format.js {}
      end
    end
  end


  private

  def participant?
    conversation = Conversation.find(params[:conversation_id])
    unless conversation.participants.include?(current_user) 
      flash[:danger] = "not possible to show messages because your are not participant to this conversation"
      redirect_to current_user
    end
  end
  def in_a_correspondance?
    conversation = Conversation.find(params[:conversation_id])
    user1 = conversation.author
    user2 = conversation.receiver
    if Correspondance.select(user1, user2)
      unless Correspondance.select(user1, user2).status == "validated"
        flash[:danger] = "not possible to show messages because the correspondance is not validated"
        redirect_to current_user
      end
    else
      flash[:danger] = "not possible to show messages because there is no correspondance"
      redirect_to current_user
    end
  end
end
