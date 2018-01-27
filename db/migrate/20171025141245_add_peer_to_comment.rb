class AddPeerToComment < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :peer, foreign_key: true
  end
end
