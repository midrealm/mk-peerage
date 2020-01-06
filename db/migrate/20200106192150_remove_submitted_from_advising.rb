class RemoveSubmittedFromAdvising < ActiveRecord::Migration[5.2]
  def change
    remove_column :advisings, :submitted, :boolean
  end
end
