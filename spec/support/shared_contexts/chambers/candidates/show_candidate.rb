shared_examples_for "get /chambers/PEERAGE/candidates/:id" do |peerage, other_peerage|
  describe "Get /chambers/#{peerage}/candidates/:id" do
    before(:each) do
      @candidate = create(:candidate, peerage_type: peerage)
    end
    context "logged in #{peerage}" do
      before(:each) do
        @peer = create(peerage)
        sign_in(@peer)
      end
      it "shows candidate and their advocate" do
        advocate = create(peerage, sca_name: 'Missy Examplemas')
        create(:advocacy, peer: advocate.public_send(peerage.to_s), candidate: @candidate)
        get "/chambers/#{peerage}/candidates/#{@candidate.id}"
        expect(response).to have_http_status(:success)
        expect(response.body).to include(@candidate.sca_name)
        expect(response.body).to include(advocate.sca_name)
      end
  
      it "shows candidate without and advocate" do
        get "/chambers/#{peerage}/candidates/#{@candidate.id}"
        expect(response).to have_http_status(:success)
        expect(response.body).to include(@candidate.sca_name)
      end
      it "shows comments" do
        create(:comment, peer: @peer.public_send(peerage.to_s), candidate: @candidate, text: "I like this candidate")
        get "/chambers/#{peerage}/candidates/#{@candidate.id}"
        expect(response.body).to include(@peer.sca_name)
        expect(response.body).to include("I like this candidate")
      end
      it "throws error for showing non-#{peerage} candidate" do
        other_peerage_candidate = create("#{other_peerage}_candidate".to_sym)
        expect{get "/chambers/#{peerage}/candidates/#{other_peerage_candidate.id}"}.to raise_error("Access Denied")
      end
    end
    context "logged in #{other_peerage} (non-#{peerage})" do
      before(:each) do
        other_peer = create(other_peerage)
        sign_in(other_peer)
      end
      it "shows not authorized error for non-#{peerage} user" do
        expect{get "/chambers/#{peerage}/candidates/#{@candidate.id}"}.to raise_error(CanCan::AccessDenied)
      end
    end
    it "redirects if not logged in" do
      get "/chambers/#{peerage}/candidates/#{@candidate.id}"
      expect(response).to have_http_status(:found)
      expect(response.body).to include('redirected')
    end
  end
end
