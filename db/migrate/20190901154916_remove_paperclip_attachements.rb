class RemovePaperclipAttachements < ActiveRecord::Migration[5.2]
  def change
    remove_attachment :peers, :profile_pic
    remove_attachment :candidates, :profile_pic
    remove_attachment :documents, :document
  end
end
