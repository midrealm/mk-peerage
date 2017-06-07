class CreateImages < ActiveRecord::Migration[5.0]
  def change
    create_table :images do |t|
      t.attachment :image
      t.references :candidate, foreign_key: true

      t.timestamps
    end
  end
end
