class AnswersController < ApplicationController
  before_action :authenticate_user!
  before_action :good_user
  before_action :set_env
  before_action :finish?
  before_action :already_answered?

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
    answers = @quiz_conv.answers
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
    if @iteration >= 14
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
    @quiz_conv = @conversation.quiz_conv
    @quiz = @quiz_conv.quiz
    @answer = Answer.new
    @iteration = @conversation.iteration_quiz.to_i
    if @iteration >= 1
      previews_quiz = @conversation.previews_quiz
      @previews_question = previews_quiz.question
      previews_answers = QuizConv.find_by(conversation: @conversation, index: @iteration - 1 ).answers
      previews_answers.each do |answer|
        if answer.author != current_user
          @previews_answer = answer.content
        end
      end
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
