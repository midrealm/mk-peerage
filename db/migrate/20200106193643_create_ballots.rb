class CreateBallots < ActiveRecord::Migration[5.2]
  def change
    create_table :ballots do |t|
      t.references :peer, foreign_key: true
      t.references :poll, foreign_key: true

      t.timestamps
    end
  end
end
