class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :correspondances, :user_one_id, :creator_id
    rename_column :correspondances, :user_two_id, :acceptor_id
  end
end
