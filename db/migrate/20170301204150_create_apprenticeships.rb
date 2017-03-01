class CreateApprenticeships < ActiveRecord::Migration[5.0]
  def change
    create_table :apprenticeships do |t|
      t.references :user, foreign_key: true
      t.references :laurel, index: true
      t.timestamps
    end
    add_foreign_key :apprenticeships, :users, column: :laurel_id
    add_index :apprenticeships, [:user_id, :laurel_id], unique: true
  end
end
