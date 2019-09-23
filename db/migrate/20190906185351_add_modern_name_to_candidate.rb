class AddModernNameToCandidate < ActiveRecord::Migration[5.2]
  def change
		add_column :candidates, :modern_name, :string
  end
end
