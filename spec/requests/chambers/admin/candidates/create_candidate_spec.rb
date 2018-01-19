require "rails_helper"
describe "post /chambers/laurel/admin/candidates" do
  context "for logged in laurel admin" do
    before(:each) do
      admin = create("laurel_admin".to_sym)
      sign_in(admin)
    end
    it "creates new candidate" do
      expect(Candidate.count).to eq(0)
      post "/chambers/laurel/admin/candidates", params: { :candidate => {sca_name: "Dingus McDOOOGLE", peerage_type: :laurel} }
      expect(Candidate.count).to eq(1)
      expect(Candidate.last.laurel?).to be_truthy
    end
    it "sets new candidate vote to false" do
      post "/chambers/laurel/admin/candidates", params: { :candidate => {sca_name: "Dingus McDOOOGLE", peerage_type: :laurel} }
      expect(Candidate.first.vote).to be_falsey 
    end
    it "redirects to laurel chambers after successful creation" do
      post "/chambers/laurel/admin/candidates", params: { :candidate => {sca_name: "Dingus McDOOOGLE", peerage_type: :laurel} }
      candidate_id = Candidate.last.id
     expect(response).to redirect_to("/chambers/laurel/candidates/#{candidate_id}")
    end
  end
end
