class CorrespondancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_correspondance, only: [:update, :destroy]
  before_action :already_exist, only: [:create]

  # GET /correspondances
  def index
    @validated_correspondances = current_user.validated_correspondances
    @sent_correspondances = current_user.sent_correspondances
    @received_correspondances = current_user.waiting_correspondances
    @refused_correspondances = current_user.refused_correspondances
    respond_to do |format|
      format.html { redirect_to current_user}
      format.js {}
    end
  end

  # POST /correspondances
  def create
    other_user = User.find(params[:correspondance][:user_id])
    @correspondance = Correspondance.new(creator: current_user, acceptor: other_user)
    message = params[:correspondance][:message]
    message == ""? message = "#{current_user.name } ask you to be his penfriend": message
    @correspondance.message = message
    respond_to do |format|
      if @correspondance.save
        format.html { redirect_to current_user, notice: 'You have send a new penfriend request' }
      else
        flash[:danger] = "Failure of request of a new penfriend"
        format.html { redirect_to other_user }
      end
    end
  end

  # PATCH/PUT /correspondances/1
  def update
    if params[:update]
      status = "validated"
    else
      status = "refused"
    end
    if @correspondance.update(status: status)
      if status == "validated"
        other_user = @correspondance.other_friend(current_user)
        other_user.update(token: other_user.token + 5)
        current_user.update(token: current_user.token + 5)
        @conversation = Conversation.create(receiver: other_user, author: current_user)
        quizs = Quiz.all
        i = 0
        quizs.level1.sample(5).each do |quiz|
          QuizConv.create(conversation: @conversation, quiz: quiz, index:i)
          i += 1
        end
        quizs.level2.sample(5).each do |quiz|
          QuizConv.create(conversation: @conversation, quiz: quiz, index:i)
          i += 1
        end
        quizs.level3.sample(5).each do |quiz|
          QuizConv.create(conversation: @conversation, quiz: quiz, index:i)
          i += 1
        end
        redirect_to current_user, notice: 'Success of acceptance of correspondance status'
      elsif status == "refused"
        redirect_to current_user, notice: 'Success of refusal of correspondance status'
      end 
    else 
      flash[:danger] = 'Failure of modification of correspondance status.'
      redirect_to current_user
    end
  end

  # DELETE /correspondances/1
  def destroy
    @correspondance.destroy
    respond_to do |format|
      format.html { redirect_to correspondances_url, notice: 'Correspondance was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_correspondance
      @correspondance = Correspondance.find(params[:id])
    end

    def already_exist
      other_user = User.find(params[:correspondance][:user_id])
      if Correspondance.already_exist?(current_user, other_user)
        flash[:danger] = 'Correspondance already exist'
        redirect_to current_user 
      end
    end
end
