class AddMessageToCorrespondances < ActiveRecord::Migration[5.2]
  def change
    add_column :correspondances, :message, :string
  end
end
