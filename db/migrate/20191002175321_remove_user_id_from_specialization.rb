class RemoveUserIdFromSpecialization < ActiveRecord::Migration[5.2]
  def change
    remove_column :specializations, :user_id, :integer
  end
end
