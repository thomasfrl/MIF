class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :good_user
  before_action :finish?
  before_action :set_env
  before_action :already_answered?

  def create
    @answer = Answer.new(author: current_user, content: params[:answer][:content], quiz_conv: @current_quiz_conv )
    if @answer.save
      i = @conversation.iteration_quiz
      @conversation.update(iteration_quiz: i + 0.5)
      if @conversation.iteration_quiz == 15
        @conversation.participants.each do |u|
          u.update(token: u.token + 5)
        end
      end
      c = Conversation.find(params[:conversation_id])
      if c.iteration_quiz.to_i == i.to_i 
        respond_to do |format|
          format.html{}
          format.js{render "wait"}
        end
      else
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
    respond_to do |format|
      format.html{}
      format.js{}
    end
  end

  private

  def already_answered?
    answers = @current_quiz_conv.answers
    unless answers.empty?
      answers.each do |a|
        if a.author == current_user
          respond_to do |format|
            format.html{
              flash[:danger] = "you have already answer the question"
              redirect_to root_path    
            }
            format.js{render "wait"}
          end
        end
      end
    end
  end 

  def finish?
    @iteration = @conversation.iteration_quiz.to_i
    if @iteration >= 15
      @quizzes = @conversation.quizzes
      @other_user = @conversation.other_participant(current_user)
      respond_to do |format|
        format.html{
          flash[:danger] = "the game is finish"
          redirect_to root_path    
        }
        format.js{render "finish"}
      end
    end
  end

  def set_env
    @current_quiz_conv = @conversation.current_quiz_conv
    @quiz = @current_quiz_conv.quiz
    @answer = Answer.new
    if @iteration >= 1
      @previews_question = @conversation.previews_question
      @previews_answer = @conversation.previews_other_answer(current_user)
    end
  end

  def good_user
    @conversation = Conversation.find(params[:conversation_id])
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
