shared_examples_for "get /chambers/PEERAGE/admin/peers/new" do |peerage, other_peerage|
  describe "Get /chambers/#{peerage}/admin/peers/new" do
    it "shows form for new user if #{peerage} admin user" do
      admin = create("#{peerage}_admin".to_sym)
      sign_in(admin)
      get "/chambers/#{peerage}/admin/peers/new"
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Add New #{peerage.capitalize}")
    end
    it "redirects if not logged in" do
      get "/chambers/#{peerage}/admin/peers/new"
      expect(response).to have_http_status(:found)
      expect(response.body).to include('redirected')
    end
    it "rasies AccessDenied Error if user is not an admin" do
      peer = create(peerage.to_sym)
      sign_in(peer)
      expect{get "/chambers/#{peerage}/admin/peers/new"}.to raise_error(CanCan::AccessDenied)
    end
    it "rasies AccessDenied Error if user is not a #{peerage} admin" do
      other_peer = create("#{other_peerage}_admin".to_sym)
      sign_in(other_peer)
      expect{get "/chambers/#{peerage}/admin/peers/new"}.to raise_error(CanCan::AccessDenied)
    end
  end
end
