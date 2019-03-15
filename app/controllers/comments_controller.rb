class CommentsController < ApplicationController
  before_action :authenticate_user!

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
        format.html { redirect_to current_user, notice: 'Comment was successfully created.' }
      else
        flash[:danger] =  'Comment was not created.'
        format.html { redirect_to current_user }
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

end
