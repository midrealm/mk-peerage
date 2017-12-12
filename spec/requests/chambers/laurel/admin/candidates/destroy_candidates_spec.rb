require "rails_helper"
describe "delete /chambers/laurel/admin/candidates/:id" do
  before(:each) do
    @candidate = create(:candidate)
  end
  context "for logged in laurel admin" do
    before(:each) do
      @admin = create(:admin)
      sign_in(@admin)
    end
    it "destroys candidate" do
      expect(Candidate.count).to eq(1)
      delete "/chambers/laurel/admin/candidates/#{@candidate.id}"
      expect(Candidate.count).to eq(0)
    end
    it "destroys comments related to candidate" do
      comment = create(:comment, candidate: @candidate, peer: @admin.peers.first, text: 'a comment is a comment.' )
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
    it "does not allow deleting of laurel candidates via laurel delete path" do
      pelican_candidate = create(:candidate, peerage_type: :pelican)
      expect(Candidate.count).to eq(2)
      expect{delete "/chambers/laurel/admin/candidates/#{pelican_candidate.id}"}.to raise_error("Access Denied")
      expect(Candidate.count).to eq(2)
    end
  end
  context "for logged in non-laurel admin" do
    before(:each) do
      @pelican_admin = create(:pelican_admin)
      sign_in(@pelican_admin)
    end
    it "shows not authorized error" do
      expect{delete "/chambers/laurel/admin/candidates/#{@candidate.id}"}.to raise_error(CanCan::AccessDenied)
      expect(Candidate.count).to eq(1)
    end 
  end
  context "for non-logged in user" do
    it "redirects" do
      delete "/chambers/laurel/admin/candidates/#{@candidate.id}"
      expect(response).to have_http_status(:found)
      expect(response.body).to include('redirected')
      expect(Candidate.count).to eq(1)
    end
  end
end
