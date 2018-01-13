shared_examples_for "get /chambers/PEERAGE/admin/candidates/:id/edit" do |peerage, other_peerage|
  describe "Get /chambers/#{peerage}/admin/candidates/:id/edit" do
    before(:each) do
      @candidate = create(:candidate, sca_name: 'Dingus McDOOOGLE', peerage_type: peerage.to_sym)
    end
    context "for logged in #{peerage} admin" do
      before(:each) do
        admin = create("#{peerage}_admin".to_sym)
        sign_in(admin)
      end
      it "shows edit page for candidate" do
        get "/chambers/#{peerage}/admin/candidates/#{@candidate.id}/edit"
        expect(response).to have_http_status(:success)
        expect(response.body).to include('Edit Candidate Dingus McDOOOGLE')
      end
      it "only shows potential #{peerage}s as advocates" do
        create(peerage.to_sym, sca_name: 'Peter Peer') 
        create(other_peerage.to_sym, sca_name: 'Octavia Other-Peer') 
        get "/chambers/#{peerage}/admin/candidates/#{@candidate.id}/edit"
        expect(response.body).to include('Peter Peer')
        expect(response.body).not_to include('Octavia Other-Peer')
      end
      it "throws error for editing non-#{peerage} candidate" do
        other_peerage_candidate = create("#{other_peerage}_candidate".to_sym)
        expect{get "/chambers/#{peerage}/admin/candidates/#{other_peerage_candidate.id}/edit"}.to raise_error("Access Denied")
      end
    end
    context "for logged in non-#{peerage} admin" do
      before(:each) do
        admin = create("#{other_peerage}_admin")
        sign_in(admin)
      end
      it "shows not authorized error" do
        expect{get "/chambers/#{peerage}/admin/candidates/#{@candidate.id}/edit"}.to raise_error(CanCan::AccessDenied)
      end
    end
    it "redirects if not logged in" do
      get "/chambers/#{peerage}/admin/candidates/#{@candidate.id}/edit"
      expect(response).to have_http_status(:found)
      expect(response.body).to include('redirected')
    end
  end
end
