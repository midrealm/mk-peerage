shared_examples_for "get /chambers/admin/royalty" do |peerage|
  describe "get /chambers/admin/royalty for #{peerage}" do
    context "for logged in #{peerage} admin" do
      before(:each) do
        @admin = create("#{peerage}_admin".to_sym)
        sign_in(@admin)
      end
      it "shows list of candidates if #{peerage} admin" do
        get "/chambers/admin/royalty"
        expect(response).to have_http_status(:success)
        expect(response.body).to include('Manage Royalty')
      end
      it "shows royalty bolded" do
        @admin.update(sca_name: 'Default Peer')
        royal = create(:royal, sca_name: 'Duke Ducky')
        get "/chambers/admin/royalty"
        expect(response.body).not_to include('<strong>Default Peer</strong>')
        expect(response.body).to include('<strong>Duke Ducky</strong>')
      end 
      it "does not show deceased users" do
        @admin.update(sca_name: 'Peter Peer')
        royalty = create(:royal, deceased: false, sca_name: 'Duke Ducky')
        dead_peer = create(peerage, sca_name: 'Dead Peer', deceased: true)
        get "/chambers/admin/royalty"
        expect(response.body).to include('Peter Peer')
        expect(response.body).to include('Duke Ducky')
        expect(response.body).not_to include('Dead Peer')
      end 
      it "does not show deceased royals" do
        royalty = create(:royal, sca_name: 'Dead Royal', deceased: true)
        get "/chambers/admin/royalty"
        expect(response.body).not_to include('Dead Royal')
      end
    end
    it "redirects if not logged in" do
      get "/chambers/admin/royalty"
      expect(response).to have_http_status(:found)
      expect(response.body).to include('redirected')
    end
    it "rasies AccessDenied Error if user is not an admin" do
      peer = create(peerage)
      sign_in(peer)
      expect{get "/chambers/admin/royalty"}.to raise_error(CanCan::AccessDenied)
    end
  end
end
