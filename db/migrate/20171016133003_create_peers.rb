class CreatePeers < ActiveRecord::Migration[5.0]
  def change
    create_table :peers do |t|
      t.string :elevated_by
      t.boolean :active
      t.boolean :vigilant
      t.date :elevation_date
      t.text :bio
      t.attachment :profile_pic
      t.string :apprenticed_to
      t.boolean :admin
      t.string :specialty_detail

      t.timestamps
    end
  end
end
