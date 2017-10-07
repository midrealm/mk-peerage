class AddAttachmentProfilePicToPeers < ActiveRecord::Migration
  def self.up
    change_table :peers do |t|
      t.attachment :profile_pic
    end
  end

  def self.down
    remove_attachment :peers, :profile_pic
  end
end
