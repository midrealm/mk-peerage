shared_examples_for "get /chambers/PEERAGE/admin/peers/new" do |peerage, other_peerage|
  describe "Get /chambers/#{peerage}/admin/peers/new" do
    it "rasies AccessDenied Error if user is not a #{peerage} admin" do
      other_peer = create("#{other_peerage}_admin".to_sym)
      sign_in(other_peer)
      expect{get "/chambers/#{peerage}/admin/peers/new"}.to raise_error(CanCan::AccessDenied)
    end
  end
end
