class AddHasLoggedInToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :has_logged_in, :boolean
  end
end
