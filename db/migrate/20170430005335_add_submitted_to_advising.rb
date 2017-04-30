class AddSubmittedToAdvising < ActiveRecord::Migration[5.0]
  def change
    add_column :advisings, :submitted, :boolean
  end
end
