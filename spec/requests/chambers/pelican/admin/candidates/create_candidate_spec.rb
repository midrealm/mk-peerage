require "rails_helper"
describe "post /chambers/pelican/admin/candidates" do
  context "for logged in pelican admin" do
    before(:each) do
      admin = create(:pelican_admin)
      sign_in(admin)
    end
    it "creates new candidate" do
      expect(Candidate.count).to eq(0)
      post '/chambers/pelican/admin/candidates', params: { :candidate => {sca_name: 'Dingus McDOOOGLE', peerage_type: :pelican} }
      expect(Candidate.count).to eq(1)
      expect(Candidate.last.pelican?).to be_truthy
    end
    it "sets new candidate vote to false" do
      post '/chambers/pelican/admin/candidates', params: { :candidate => {sca_name: 'Dingus McDOOOGLE', peerage_type: :pelican} }
      expect(Candidate.first.vote).to be_falsey 
    end
    it "redirects to pelican chambers after successful creation" do
      post '/chambers/pelican/admin/candidates', params: { :candidate => {sca_name: 'Dingus McDOOOGLE', peerage_type: :pelican} }
      candidate_id = Candidate.last.id
     expect(response).to redirect_to("/chambers/pelican/candidates/#{candidate_id}")
    end
  end
end
