shared_examples_for "get /chambers/PEERAGE/admin/peers/:id/edit" do |peerage, other_peerage|
  describe "get /chambers/#{peerage}/admin/peers/:id/edit" do
    context "for logged in #{peerage} admin" do
      before(:each) do
        admin = create("#{peerage}_admin".to_sym)
        sign_in(admin)
      end
      it "raises Access Denied when editing non-#{peerage} user" do
        other_peer = create(other_peerage)
        expect{get "/chambers/#{peerage}/admin/peers/#{other_peer.peers.first.id}/edit"}.to raise_error("Access Denied")
  
      end
    end
  end
end
