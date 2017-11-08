class RemoveParentIdFromGroup < ActiveRecord::Migration[5.0]
  def change
    remove_column :groups, :parent_id, :integer
  end
end
