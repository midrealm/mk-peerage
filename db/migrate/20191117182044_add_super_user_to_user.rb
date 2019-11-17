class AddSuperUserToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :superuser, :boolean
  end
end
