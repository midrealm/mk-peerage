require "rails_helper"

shared_examples_for "post /chambers/PEERAGE/admin/candidates" do |peerage|
  describe "post /chambers/#{peerage}/admin/candidates" do
    context "for logged in #{peerage} admin" do
      before(:each) do
        admin = create("#{peerage}_admin".to_sym)
        sign_in(admin)
      end
      it "creates new candidate" do
        expect(Candidate.count).to eq(0)
        post "/chambers/#{peerage}/admin/candidates", params: { :candidate => {sca_name: "Dingus McDOOOGLE", peerage_type: peerage.to_sym} }
        expect(Candidate.count).to eq(1)
        expect(Candidate.last.public_send("#{peerage}?")).to be_truthy
      end
      it "sets new candidate vote to false" do
        post "/chambers/#{peerage}/admin/candidates", params: { :candidate => {sca_name: "Dingus McDOOOGLE", peerage_type: peerage.to_sym} }
        expect(Candidate.first.vote).to be_falsey 
      end
      it "redirects to #{peerage} chambers after successful creation" do
        post "/chambers/#{peerage}/admin/candidates", params: { :candidate => {sca_name: "Dingus McDOOOGLE", peerage_type: peerage.to_sym} }
        candidate_id = Candidate.last.id
       expect(response).to redirect_to("/chambers/#{peerage}/candidates/#{candidate_id}")
      end
    end
  end
end
