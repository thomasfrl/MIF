class QuizController < ApplicationController
  def new
  end

  def create
  end

  def show
    @quizs = Quiz.all
  end

  def display_question
  end

  def skip_question
  end

end
