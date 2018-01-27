class RemoveUserFromAdvising < ActiveRecord::Migration[5.0]
  def change
    remove_reference :advisings, :user, foreign_key: true
  end
end
