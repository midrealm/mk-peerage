require 'rails_helper'
describe "get /chambers/laurel/candidates/id/documents" do
  context "signed in laurel" do
    before(:each) do
      @peer = create(:laurel_peer)
      sign_in(@peer.user)
      @candidate = create(:candidate, peerage_type: :laurel)
      get "/chambers/laurel/candidates/#{@candidate.id}/documents"
    end
    it "shows documents page for candidate" do
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Documents")
    end
    it "has form for adding a new document" do
      expect(response.body).to include("Add an Image/Document")
    end
    it "has a link to main candidate page" do
      expect(response.body).to include("<a href=\"/chambers/laurel/candidates/#{@candidate.id}\">")
    end
  end
end
