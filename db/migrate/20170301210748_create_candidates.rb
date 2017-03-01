class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|
      t.string :sca_name
      t.boolean :vote

      t.timestamps
    end
  end
end
