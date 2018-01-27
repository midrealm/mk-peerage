class AddPeerToSpecializations < ActiveRecord::Migration[5.0]
  def change
    add_reference :specializations, :peer, foreign_key: true
  end
end
