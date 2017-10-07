class ChangeUserToPeer < ActiveRecord::Migration[5.0]
  def change
    remove_reference :comments, :user, foreign_key: true
    add_reference  :comments, :peer, foreign_key: true

    remove_reference :advisings, :user, foreign_key: true
    add_reference  :advisings, :peer, foreign_key: true

    remove_reference :advocacies, :user, foreign_key: true
    add_reference  :advocacies, :peer, foreign_key: true

    remove_reference :specializations, :user, foreign_key: true
    add_reference  :specializations, :peer, foreign_key: true
  end
end
