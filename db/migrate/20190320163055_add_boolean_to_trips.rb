class AddBooleanToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :validated, :boolean, default: false
  end
end
