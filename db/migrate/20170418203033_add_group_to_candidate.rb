class AddGroupToCandidate < ActiveRecord::Migration[5.0]
  def change
    add_reference :candidates, :group, foreign_key: true
  end
end
