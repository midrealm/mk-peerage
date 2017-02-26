class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :sca_name, :string
    add_column :users, :modern_name, :string
    add_column :users, :street, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zipcode, :string
    add_column :users, :phone, :string
    add_column :users, :elevators, :string
  end
end
