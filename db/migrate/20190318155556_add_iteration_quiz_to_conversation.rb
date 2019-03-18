class AddIterationQuizToConversation < ActiveRecord::Migration[5.2]
  def change
    add_column :conversations, :iteration_quiz, :float, default: 0
  end
end
