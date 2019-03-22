class AddBudgetRefToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :budget, foreign_key: true
  end
end
