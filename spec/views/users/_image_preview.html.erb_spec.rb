require 'rails_helper'
RSpec.describe "users/_image_preview.html.erb" do
 before(:each) do
   document = fixture_file_upload("#{fixture_path}/images/portrait.jpg", 'image/jpg')
   @laurel_peer = create(:laurel_peer, profile_pic: document)
   @laurel_peer.user.update(arms: document)
 end
  context "if no peerage param" do
    it "shows arms image" do
      render partial: "users/image_preview", locals: { user: @laurel_peer.user, peerage: nil }
      expect(rendered).to have_css('#profile_pic_preview_container.hidden')
      expect(rendered).not_to have_css('#profile_preview img')
      expect(rendered).to have_selector('#arms_preview img')
    end
  end
  context "if peerage params" do
    it "shows peerage profile pic" do
      render partial: "users/image_preview", locals: { user: @laurel_peer.user, peerage: 'laurel' }
      expect(rendered).to have_css('#arms_preview_container.hidden')
      expect(rendered).to have_css('#profile_preview img')
      expect(rendered).not_to have_selector('#arms_preview img')
    end
  end
end
