class CreatePeers < ActiveRecord::Migration[5.0]
  def change
    create_table :peers do |t|
      t.string :type
      t.text :bio
      t.date :elevation_date
      t.string :elevated_by
      t.string :specialty_detail
      t.boolean :active
      t.boolean :vigilant
      t.string :role
      t.references :user  
    
      t.timestamps
    end
  end
end
