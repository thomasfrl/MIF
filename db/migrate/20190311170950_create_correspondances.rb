class CreateCorrespondances < ActiveRecord::Migration[5.2]
  def change
    create_table :correspondances do |t|
      t.references :user1, index: true
      t.references :user2, index: true

      t.timestamps
    end
  end
end
