class CreateAdvisings < ActiveRecord::Migration[5.0]
  def change
    create_table :advisings do |t|
      t.references :user, foreign_key: true
      t.references :candidate, foreign_key: true
      t.references :poll, foreign_key: true
      t.references :judgement, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
