class RemoveApprenticeship < ActiveRecord::Migration[5.0]
  def change
    drop_table :apprenticeships
  end
end
