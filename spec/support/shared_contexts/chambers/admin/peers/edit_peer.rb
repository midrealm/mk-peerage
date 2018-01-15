shared_examples_for "get /chambers/PEERAGE/admin/peers/:id/edit" do |peerage, other_peerage|
  describe "get /chambers/#{peerage}/admin/peers/:id/edit" do
    context "for logged in #{peerage} admin" do
      before(:each) do
        admin = create("#{peerage}_admin".to_sym)
        sign_in(admin)
      end
      it "shows edit page for #{peerage}" do
        new_user = create(peerage, sca_name: 'Dingus McDOOOGLE')
        get "/chambers/#{peerage}/admin/peers/#{new_user.peers.first.id}/edit"
        expect(response).to have_http_status(:success)
        expect(response.body).to include("Edit #{peerage.capitalize} Dingus McDOOOGLE")
      end
      it "raises Access Denied when editing non-#{peerage} user" do
        other_peer = create(other_peerage)
        expect{get "/chambers/#{peerage}/admin/peers/#{other_peer.peers.first.id}/edit"}.to raise_error("Access Denied")
  
      end
    end
    it "redirects if not admin userlogged in" do
      user = create(peerage, sca_name: 'Dingus McDOOOGLE')
      get "/chambers/#{peerage}/admin/peers/#{user.peers.first.id}/edit"
      expect(response).to have_http_status(:found)
      expect(response.body).to include('redirected')
    end
  end
end
