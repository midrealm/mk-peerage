class RemoveColumnsFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_attachment :users, :profile_pic
    remove_column :users, :elevators
    remove_column :users, :elevation_date
    remove_column :users, :active
    remove_column :users, :vigilant
    remove_column :users, :bio
    remove_column :users, :role
    remove_column :users, :laurel
    remove_column :users, :specialty_detail
    remove_column :users, :apprenticed_to
  end
end
