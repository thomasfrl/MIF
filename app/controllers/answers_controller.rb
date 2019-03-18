class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_env
  before_action :good_user
  before_action :already_answered?

  def create
    @answer = Answer.new(author: current_user, content: params[:answer][:content] )
    @answer.quiz_conv = @quiz_conv
    if @answer.save
      flash[:notice] = "Answer taken into account"
      @conversation.iteration_quiz += 0.5
      redirect_to current_user
    else 
      flash[:danger] = "Problem with your answer. It was not registred"
      redirect_to current_user
    end
  end

  def new
    @answer = Answer.new
  end

  private

  def already_answered?
    answers = @quiz_conv.answers
    unless answers.empty?
      answers.each do |a|
        if a.author == current_user
          flash[:danger] = "you have already answer the question"
          redirect_to root_path
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
      flash[:danger] = "not possible to make a quiz with someone you don't have any conversation"
      redirect_to root_path
    end
  end
end
