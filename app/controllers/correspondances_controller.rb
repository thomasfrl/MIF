class CorrespondancesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_correspondance, only: [:update, :destroy]
  before_action :already_exist, only: [:create]

  # GET /correspondances
  def index
    @correspondances = current_user.correspondances
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
        @conversation = Conversation.new(receiver: other_user, author: current_user)
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
    elsif
      status = "refused"
    end
    if @correspondance.update(status: status)
      redirect_to current_user, notice: 'Success of modification of correspondance status'
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
