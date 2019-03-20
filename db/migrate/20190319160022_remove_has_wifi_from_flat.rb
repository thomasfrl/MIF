class RemoveHasWifiFromFlat < ActiveRecord::Migration[5.2]
  def change
    remove_column :flats, :has_wifi, :boolean
  end
end
