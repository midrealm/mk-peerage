class RemoveJudgementFromAdvising < ActiveRecord::Migration[5.0]
  def change
    remove_reference :advisings, :judgement, foreign_key: true
  end
end
