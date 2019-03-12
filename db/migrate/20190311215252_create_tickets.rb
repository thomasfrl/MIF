class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :object
      t.string :category
      t.text :content
      t.references :user, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
