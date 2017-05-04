class CreatePollResults < ActiveRecord::Migration[5.0]
  def change
    create_table :poll_results do |t|
      t.references :candidate, foreign_key: true
      t.references :poll, foreign_key: true
      t.integer :drop
      t.integer :no_strong_opinion
      t.integer :wait
      t.integer :elevate
      t.float :rec
      t.float :fav

      t.timestamps
    end
  end
end
