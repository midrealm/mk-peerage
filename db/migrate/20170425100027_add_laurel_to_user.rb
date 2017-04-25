class AddLaurelToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :laurel, :boolean
  end
end
