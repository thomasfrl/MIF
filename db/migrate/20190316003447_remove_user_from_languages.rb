class RemoveUserFromLanguages < ActiveRecord::Migration[5.2]
  def change
    remove_reference :languages, :user, foreign_key: true
  end
end
