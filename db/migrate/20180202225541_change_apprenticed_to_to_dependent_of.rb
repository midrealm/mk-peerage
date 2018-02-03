class ChangeApprenticedToToDependentOf < ActiveRecord::Migration[5.0]
  def change
    rename_column :peers, :apprenticed_to, :dependent_of
  end
end
