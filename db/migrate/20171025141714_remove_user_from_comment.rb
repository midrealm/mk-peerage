class RemoveUserFromComment < ActiveRecord::Migration[5.0]
  def change
    remove_reference :comments, :user, foreign_key: true
  end
end
