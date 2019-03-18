class AnswersController < ApplicationController
  def create
    @answer = Answer.new
    @answer.author = current_user
    @answer.content = params[:answer][]

  end

  def new
    @answer = Answer.new
    @conversation = Conversation.find(params[:conversation_id])
    @quiz = @conversation.quizzes[@conversation.iteration_quiz.to_i]
  end
end
