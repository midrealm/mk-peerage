class AddSlugToGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :groups, :slug, :string
  end
end
