class AddSpecialtyDetailToCandidate < ActiveRecord::Migration[5.0]
  def change
    add_column :candidates, :specialty_detail, :string
  end
end
