class AddActiveFieldsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :active, :boolean
    add_column :users, :deceased, :boolean
    add_column :users, :vigilant, :boolean
    add_column :users, :elevation_date, :date
  end
end
