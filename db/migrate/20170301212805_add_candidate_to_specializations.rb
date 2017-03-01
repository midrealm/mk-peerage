class AddCandidateToSpecializations < ActiveRecord::Migration[5.0]
  def change
    add_reference :specializations, :candidate, foreign_key: true
  end
end
