class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :description
      t.integer :age
      t.text :welcome_message
      t.string :nationality
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
