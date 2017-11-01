class AddPeerageTypeToCandidate < ActiveRecord::Migration[5.0]
  def change
    add_column :candidates, :peerage_type, :integer
  end
end
