class Answer < ApplicationRecord
  belongs_to :quiz_conv
  belongs_to :author, class_name: "User"
  
  def quiz
    self.quiz_conv.quiz
  end

  def conversation
    self.quiz_conv.conversation
  end

end
