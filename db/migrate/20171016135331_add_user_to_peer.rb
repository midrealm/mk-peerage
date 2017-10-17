class AddUserToPeer < ActiveRecord::Migration[5.0]
  def change
    add_reference :peers, :user, foreign_key: true
  end
end
