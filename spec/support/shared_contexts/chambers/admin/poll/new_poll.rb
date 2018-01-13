shared_examples_for "get /chambers/PEERAGE/admin/poll/new" do |peerage,other_peerage|
  describe "Get /chambers/#{peerage}/admin/poll/new" do
    it "shows form for new user if admin user" do
      admin = create("#{peerage}_admin".to_sym)
      sign_in(admin)
      get "/chambers/#{peerage}/admin/poll/new"
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Create New #{peerage.capitalize} Poll")
    end
    it "redirects if not logged in" do
      get "/chambers/#{peerage}/admin/poll/new"
      expect(response).to have_http_status(:found)
      expect(response.body).to include("redirected")
    end
    it "rasies AccessDenied Error if user is not an admin" do
      peer = create(peerage)
      sign_in(peer)
      expect{get "/chambers/#{peerage}/admin/poll/new"}.to raise_error(CanCan::AccessDenied)
    end
  end
end
