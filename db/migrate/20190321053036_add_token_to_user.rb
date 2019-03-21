class AddTokenToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :token, :integer, default: 0
  end
end
