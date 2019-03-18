class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_env
  before_action :good_user
  #before_action :already_answered?

  def create
    @answer = Answer.new(author: current_user, content: params[:answer][:content] )
    @answer.quiz_conv = @quiz_conv
    if @answer.save
      i = @conversation.iteration_quiz
      @conversation.update(iteration_quiz: i + 0.5)
      c = Conversation.find(params[:conversation_id])
      if c.iteration_quiz.to_i == i.to_i 
        respond_to do |format|
          format.html{}
          format.js{render "wait"}
        end
      else
        @answer = Answer.new
        set_env
        respond_to do |format|
          format.html{}
          format.js{render "new"}
        end
      end
    else 
      flash[:danger] = "Problem with your answer. It was not registred"
      redirect_to current_user
    end
  end

  def new
    @answer = Answer.new
    respond_to do |format|
      format.html{}
      format.js{}
    end
  end

  private

  def already_answered?
    answers = @quiz_conv.answers
    unless answers.empty?
      answers.each do |a|
        if a.author == current_user
          format.html{
            flash[:danger] = "you have already answer the question"
            redirect_to root_path    
          }
          format.js{render "wait"}
        end
      end
    end
  end 

  def set_env
    @conversation = Conversation.find(params[:conversation_id])
    @quiz_conv = QuizConv.find_by(conversation: @conversation, index: @conversation.iteration_quiz.to_i)
    @quiz = @quiz_conv.quiz
  end

  def good_user
    unless @conversation.participants.include?(current_user)
      respond_to do |format|
        format.html{
          flash[:danger] = "not possible to make a quiz with someone you don't have any conversation"
          redirect_to root_path    
        }
        format.js{render "wait"}
      end

    end
  end
end
