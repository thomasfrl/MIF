class AddStatusToCorrespondances < ActiveRecord::Migration[5.2]
  def change
    add_column :correspondances, :status, :string, :default => "waiting"
  end
end
