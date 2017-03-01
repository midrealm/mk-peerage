class AddApprenticedToToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :apprenticed_to, :string
  end
end
