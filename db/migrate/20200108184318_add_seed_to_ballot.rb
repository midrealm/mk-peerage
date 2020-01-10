class AddSeedToBallot < ActiveRecord::Migration[5.2]
  def change
    add_column :ballots, :seed, :integer
  end
end
