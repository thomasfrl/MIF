class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :quiz_conv, foreign_key: true
      t.text :content
      t.references :author, index: true

      t.timestamps
    end
  end
end
