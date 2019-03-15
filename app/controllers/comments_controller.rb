class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :correspondance_validated?, only: [:create]

  # GET /comments
  def index
    @user = current_user
    @sent_comments = @user.authored_comments
    @received_comments = @user.received_comments
  end

  # POST /comments
  def create
    other_user = User.find(params[:comment][:user_id])
    content = params[:comment][:content]
    @comment = Comment.new(author: current_user, receiver: other_user, content: content)

    respond_to do |format|
      if @comment.save
        binding.pry

        format.html { redirect_to other_user, notice: 'Comment was successfully created.' }
      else

        flash[:danger] =  'Comment was not created.'
        format.html { redirect_to other_user }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def correspondance_validated?
    other_user = User.find(params[:comment][:user_id])
    c = Correspondance.select(current_user, other_user)
    if c == false
      flash[:danger] = "not possible to leave comment if you are not in a correspondance"
      redirect_to current_user
    elsif c.status == "waiting"
      flash[:danger] = "You can not leave a comment if the correspondance is not validated"
      redirect_to current_user
    elsif c.status == "refused"
      flash[:danger] = "You can not leave a comment if the correspondance is refused"
      redirect_to current_user
    end
  end

end
