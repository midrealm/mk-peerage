class AddAncestryToSpecialties < ActiveRecord::Migration[5.2]
  def change
    add_column :specialties, :ancestry, :string
    add_index :specialties, :ancestry
  end
end
