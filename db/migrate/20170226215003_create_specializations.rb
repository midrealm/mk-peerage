class CreateSpecializations < ActiveRecord::Migration[5.0]
  def change
    create_table :specializations do |t|
      t.references :user, foreign_key: true
      t.references :specialty, foreign_key: true

      t.timestamps
    end
  end
end
