class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.references :correspondance, foreign_key: true
      t.references :host, index: true
      t.integer :duration
      t.datetime :start_date

      t.timestamps
    end
  end
end
