shared_examples_for "put /chambers/PEERAGE/admin/PEERS/:id" do |peerage, other_peerage|
  describe "put /chambers/#{peerage}/admin/#{peerage}s/:id" do
    context "for signed in #{peerage} admin" do
      before(:each) do
        admin = create("#{peerage}_admin".to_sym)
        sign_in(admin)
      end
      it "update profile for signed in #{peerage} admin, and redirects to profile page" do
        newly_deceased = create(peerage, sca_name: "Newly Deceased", deceased: false)
  
        expect(User.last.sca_name).to eq("Newly Deceased")
        expect(Peer.last.active).to be_truthy
        expect(User.last.deceased).to be_falsy
        put "/chambers/#{peerage}/admin/#{peerage}s/#{newly_deceased.peers.first.id}", params: { peerage => {deceased: true} }
        expect(response).to redirect_to "/chambers/#{peerage}/admin/#{peerage}s"
        expect(Peer.last.active).to be_falsy
        expect(User.last.deceased).to be_truthy
      end
      it "raises Access Denied when updating of status of non-#{peerage}s" do
        deceased_other_peer = create(other_peerage, sca_name: "Octavia OtherPeer", deceased: false) 
        expect(User.last.deceased).to be_falsy
        expect{put "/chambers/#{peerage}/admin/#{peerage}s/#{deceased_other_peer.peers.first.id}", params: { peerage => {deceased: true} }}.to raise_error("Access Denied")
        expect(User.last.deceased).to be_falsy
      end
    end
    it "redirects if not logged in" do
      newly_deceased = create(peerage, sca_name: "Newly Deceased", deceased: false)
      put "/chambers/#{peerage}/admin/#{peerage}s/#{newly_deceased.id}", params: { peerage => {deceased: true} }
      expect(response).to have_http_status(:found)
      expect(response.body).to include("redirected")
    end
  end
end
