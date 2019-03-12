class QuizController < ApplicationController
  def new
  end

  def create
  end

  def show
    @level1 = Quiz.where(level: 1)
    @level2 = Quiz.where(level: 2)
    @level3 = Quiz.where(level: 3)
  end
end
