shared_examples_for "get /chambers/admin/royalty/:id/edit" do |peerage|
  describe "get /chambers/admin/royalty/:id/edit for #{peerage}" do
    it "shows edit page for royal" do
      admin = create("#{peerage}_admin".to_sym)
      sign_in(admin)
      royal = create(:royal, sca_name: "Dingus McDOOOGLE")
      get "/chambers/admin/royalty/#{royal.id}/edit"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Edit Royalty Status of Dingus McDOOOGLE')
    end
    it "redirects if not logged in" do
      royal = create(:royal)
      get "/chambers/admin/royalty/#{royal.id}/edit"
      expect(response).to have_http_status(:found)
      expect(response.body).to include('redirected')
    end
  end
end
