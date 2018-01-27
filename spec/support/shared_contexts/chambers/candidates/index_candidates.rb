shared_examples_for "get /chambers/PEERAGE/candidates" do |peerage,other_peerage|
  describe "get /chambers/#{peerage}/candidates" do
    context "signed in #{peerage}" do
      before(:each) do
        @peer = create(peerage)
        sign_in(@peer)
        @candidate = create(:candidate, peerage_type: peerage)
        
      end
      it "only shows #{peerage} candidates" do
        other_peerage_candidate = create(:candidate, sca_name: "Octavia OtherPeerage", vote: false, peerage_type: other_peerage)
        peerage_candidate = create(:candidate, sca_name: "Peter Peer", vote: true, peerage_type: peerage)
        get "/chambers/#{peerage}/candidates"
        expect(response.body).not_to include("Octavia OtherPeerage")
        expect(response.body).to include("Peter Peer")
      end
    end
  
  
    context "logged in #{other_peerage} (non-#{peerage})" do
      before(:each) do
        other_peer = create(other_peerage)
        sign_in(other_peer)
      end
      it "shows not authorized error for non-#{peerage} user" do
        expect{get "/chambers/#{peerage}/candidates/"}.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
