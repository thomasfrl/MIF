class CreateFlats < ActiveRecord::Migration[5.2]
  def change
    create_table :flats do |t|
      t.references :user, foreign_key: true
      t.string :adress
      t.text :description
      t.boolean :has_wifi

      t.timestamps
    end
  end
end
