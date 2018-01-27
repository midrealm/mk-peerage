class AddPeerToAdvising < ActiveRecord::Migration[5.0]
  def change
    add_reference :advisings, :peer, foreign_key: true
  end
end
