class AddPeerageTypeToPoll < ActiveRecord::Migration[5.0]
  def change
    add_column :polls, :peerage_type, :integer
  end
end
