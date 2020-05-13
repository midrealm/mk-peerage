class AddNoResponseToPollResult < ActiveRecord::Migration[5.2]
  def change
    add_column :poll_results, :no_response, :integer
  end
end
