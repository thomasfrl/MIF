class CreateCorrespondances < ActiveRecord::Migration[5.2]
  def change
    create_table :correspondances do |t|
      t.references :user_one
      t.references :user_two

      t.timestamps
    end
  end
end
