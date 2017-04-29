class CreateJudgements < ActiveRecord::Migration[5.0]
  def change
    create_table :judgements do |t|
      t.string :name

      t.timestamps
    end
  end
end
