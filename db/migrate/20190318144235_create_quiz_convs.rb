class CreateQuizConvs < ActiveRecord::Migration[5.2]
  def change
    create_table :quiz_convs do |t|
      t.references :quiz, foreign_key: true
      t.references :conversation, foreign_key: true
      t.integer :index
      t.timestamps
    end
  end
end
