shared_examples_for "get /chambers/PEERAGE/admin/peers" do |peerage, other_peerage|
  describe "get /chambers/#{peerage}/admin/peers" do
    context "for #{peerage} admin" do
      before(:each) do
        admin = create("#{peerage}_admin".to_sym, sca_name: 'Peter Peer')
        sign_in(admin)
      end
      it "does not show non-#{peerage} peers" do
        create("#{other_peerage}_user".to_sym, sca_name: 'Octavia OtherPeer')
        get "/chambers/#{peerage}/admin/peers"
        expect(response.body).to include('Peter Peer')
        expect(response.body).not_to include('Octavia OtherPeer')
      end
    end
  end
end
