class AddColumnsToFlat < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :place, :integer
    add_column :flats, :room, :string
    add_column :flats, :sleep, :string
  end
end
