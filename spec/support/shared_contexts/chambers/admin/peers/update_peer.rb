shared_examples_for "put /chambers/PEERAGE/admin/peers/:id" do |peerage, other_peerage|
  describe "put /chambers/#{peerage}/admin/peers/:id" do
    context "for signed in #{peerage} admin" do
      before(:each) do
        admin = create("#{peerage}_admin".to_sym)
        sign_in(admin)
      end
      it "raises Access Denied when updating of status of non-#{peerage}s" do
        deceased_other_peer = create("#{other_peerage}_user".to_sym, sca_name: "Octavia OtherPeer", deceased: false) 
        expect(User.last.deceased).to be_falsy
        expect{put "/chambers/#{peerage}/admin/peers/#{deceased_other_peer.peers.first.id}", params: { peerage => {deceased: true} }}.to raise_error("Access Denied")
        expect(User.last.deceased).to be_falsy
      end
    end
  end
end
