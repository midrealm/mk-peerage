class AddSpecialtyDetailToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :specialty_detail, :string
  end
end
