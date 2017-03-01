class AddProfilePicToCandidate < ActiveRecord::Migration[5.0]
  def change
    add_attachment :candidates, :profile_pic 
  end
end
