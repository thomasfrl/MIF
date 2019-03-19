class QuizConv < ApplicationRecord
  belongs_to :quiz
  belongs_to :conversation
  has_many :answers, dependent: :destroy
end
