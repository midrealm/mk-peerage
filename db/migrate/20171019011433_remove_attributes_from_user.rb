class RemoveAttributesFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :elevators, :string
    remove_column :users, :active, :boolean
    remove_column :users, :vigilant, :boolean
    remove_column :users, :elevation_date, :date
    remove_column :users, :bio, :text
    remove_attachment :users, :profile_pic
    remove_column :users, :apprenticed_to, :string
    remove_column :users, :role, :integer
    remove_column :users, :specialty_detail, :string
    #remove_column :users, :laurel
    
  end
end
