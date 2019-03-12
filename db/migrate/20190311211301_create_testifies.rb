class CreateTestifies < ActiveRecord::Migration[5.2]
  def change
    create_table :testifies do |t|
      t.references :user, foreign_key: true
      t.text :content
      t.boolean :accepted

      t.timestamps
    end
  end
end
