shared_examples_for "get /chambers/PEERAGE/admin/PEERS" do |peerage, other_peerage|
  describe "get /chambers/#{peerage}/admin/#{peerage}s" do
    context "for #{peerage} admin" do
      before(:each) do
        admin = create("#{peerage}_admin".to_sym, sca_name: 'Peter Peer')
        sign_in(admin)
      end
      it "shows list of #{peerage}s if admin user" do
        get "/chambers/#{peerage}/admin/#{peerage}s"
        expect(response).to have_http_status(:success)
        expect(response.body).to include("Manage #{peerage.capitalize}s")
      end
      it "does not show royals" do
        royalty = create(:royal, sca_name: 'Duke Ducky')
        get "/chambers/#{peerage}/admin/#{peerage}s"
        expect(response.body).to include('Peter Peer')
        expect(response.body).not_to include('Duke Ducky')
      end
      it "does not show non-#{peerage} peers" do
        create(other_peerage, sca_name: 'Octavia OtherPeer')
        get "/chambers/#{peerage}/admin/#{peerage}s"
        expect(response.body).to include('Peter Peer')
        expect(response.body).not_to include('Octavia OtherPeer')
      end
    end
    it "redirects if not logged in" do
      get "/chambers/#{peerage}/admin/#{peerage}s"
      expect(response).to have_http_status(:found)
      expect(response.body).to include('redirected')
    end
    it "rasies AccessDenied Error if user is not an admin" do
      peer = create(peerage)
      sign_in(peer)
      expect{get "/chambers/#{peerage}/admin/#{peerage}s"}.to raise_error(CanCan::AccessDenied)
    end
  end
end
