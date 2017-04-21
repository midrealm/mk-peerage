class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :parent_id
      t.references :group_type, foreign_key: true

      t.timestamps
    end
  end
end
