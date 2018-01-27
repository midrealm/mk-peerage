class AddPeerageTypeToSpecialty < ActiveRecord::Migration[5.0]
  def change
    add_column :specialties, :peerage_type, :integer
  end
end
