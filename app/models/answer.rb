class Answer < ApplicationRecord
  belongs_to :conversation
  belongs_to :quiz
  belongs_to :author, class_name: "User"
end
