class RemoveArmsFromUser < ActiveRecord::Migration[5.2]
  def change
    remove_attachment :users, :arms
  end
end
