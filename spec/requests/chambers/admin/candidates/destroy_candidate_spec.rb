require 'rails_helper'
describe "delete /chambers/PEERAGE/admin/candidates/:id" do
  before(:each) do
    @candidate = create(:candidate, sca_name: "Dingus McDOOOOgle", peerage_type: :laurel)
  end
  context "for signed in admin laurel" do
    before(:each) do
      @admin = create("laurel_admin".to_sym)
      sign_in(@admin)
    end
    it "deletes laurel candidate" do
      expect(Candidate.count).to eq(1)
      delete "/chambers/laurel/admin/candidates/#{@candidate.id}"
      expect(Candidate.count).to eq(0)
    end
    it "redirects to candidates admin path" do
      delete "/chambers/laurel/admin/candidates/#{@candidate.id}"
      expect(response).to redirect_to("/chambers/laurel/admin/candidates")
    end
    it "destroys comments related to candidate" do
      comment = create(:comment, candidate: @candidate, peer: @admin.peers.first, text: "a comment is a comment." )
      expect(Comment.count).to eq(1)
      delete "/chambers/laurel/admin/candidates/#{@candidate.id}"
      expect(Comment.count).to eq(0)
    end
    it "destroys images related to candidate" do
      image = create(:image, candidate: @candidate) 
      expect(Image.count).to eq(1)
      delete "/chambers/laurel/admin/candidates/#{@candidate.id}"
      expect(Image.count).to eq(0)
    end

    it "destroys advocacies related to candidate" do
      advocacy = create(:advocacy, candidate: @candidate, peer: @admin.peers.first) 
      expect(Advocacy.count).to eq(1)
      delete "/chambers/laurel/admin/candidates/#{@candidate.id}"
      expect(Advocacy.count).to eq(0)
    end
    it "destroys specializations related to candidate" do
      specialization = create(:specialization, candidate: @candidate) 
      expect(Specialization.count).to eq(1)
      delete "/chambers/laurel/admin/candidates/#{@candidate.id}"
      expect(Specialization.count).to eq(0)
    end
    it "destroys poll_results related to candidate" do
      poll_result = create(:poll_result, candidate: @candidate) 
      expect(PollResult.count).to eq(1)
      delete "/chambers/laurel/admin/candidates/#{@candidate.id}"
      expect(PollResult.count).to eq(0)
    end
    it "destroys advisings related to candidate" do
      advising = create(:advising, candidate: @candidate, peer: @admin.peers.first) 
      expect(Advising.count).to eq(1)
      delete "/chambers/laurel/admin/candidates/#{@candidate.id}"
      expect(Advising.count).to eq(0)
    end
  end
  it "redirects if not logged in" do
    delete "/chambers/laurel/admin/candidates/#{@candidate.id}"
    expect(response).to have_http_status(:found)
    expect(response.body).to include("redirected")
  end
end
