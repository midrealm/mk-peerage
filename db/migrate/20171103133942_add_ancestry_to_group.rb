class AddAncestryToGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :ancestry, :string
    add_index :groups, :ancestry
  end
end
