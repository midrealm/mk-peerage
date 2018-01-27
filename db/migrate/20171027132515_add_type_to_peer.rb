class AddTypeToPeer < ActiveRecord::Migration[5.0]
  def change
    add_column :peers, :type, :string
  end
end
