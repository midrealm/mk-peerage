class AddJudgementToAdvising < ActiveRecord::Migration[5.0]
  def change
    add_column :advisings, :judgement, :integer
  end
end
