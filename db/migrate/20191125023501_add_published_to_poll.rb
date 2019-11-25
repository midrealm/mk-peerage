class AddPublishedToPoll < ActiveRecord::Migration[5.2]
  def change
    add_column :polls, :published, :boolean
  end
end
