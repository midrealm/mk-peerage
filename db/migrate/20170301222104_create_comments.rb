class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :candidate, foreign_key: true
      t.text :text

      t.timestamps
    end
  end
end
