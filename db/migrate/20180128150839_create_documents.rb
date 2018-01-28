class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.references :peer, foreign_key: true
      t.references :candidate, foreign_key: true
      t.attachment :document

      t.timestamps
    end
  end
end
