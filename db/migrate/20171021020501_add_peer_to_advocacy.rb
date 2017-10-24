class AddPeerToAdvocacy < ActiveRecord::Migration[5.0]
  def change
    add_reference :advocacies, :peer, foreign_key: true
  end
end
