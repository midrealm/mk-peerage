class CreateDependencies < ActiveRecord::Migration[5.0]
  def change
    create_table :dependencies do |t|
      t.references :peer, foreign_key: true
      t.references :superior, index: true

      t.timestamps
    end
    add_foreign_key :dependencies, :peers, column: :superior_id
    add_index :dependencies, [:peer_id, :superior_id], unique: true
  end
end
