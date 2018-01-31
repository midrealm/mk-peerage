class AddSlugToSpecialty < ActiveRecord::Migration[5.0]
  def change
    add_column :specialties, :slug, :string
  end
end
