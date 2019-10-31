class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.integer :peerage_type
      t.text :body

      t.timestamps
    end
  end
end
