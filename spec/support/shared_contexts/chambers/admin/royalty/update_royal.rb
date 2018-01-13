shared_examples_for "put /chambers/admin/royalty/:id" do |peerage|
  describe "put /chambers/admin/royalty/:id for #{peerage}" do
    it "edits royalty status for given user, redirects to royalty manage page" do
      admin = create("#{peerage}_admin".to_sym)
      royal = create(:royal, sca_name: 'New Royal', royalty: false)
      sign_in(admin)
  
      expect(User.last.sca_name).to eq('New Royal')
      expect(User.last.royalty).to be_falsy
      put "/chambers/admin/royalty/#{royal.id}", params: { :royal => {royalty: true} }
      expect(response).to redirect_to '/chambers/admin/royalty'
      expect(User.last.royalty).to be_truthy
    end
    it "redirects if not logged in" do
      royal = create(:royal)
      put "/chambers/admin/royalty/#{royal.id}", params: { :royal => {royalty: false} }
      expect(response).to have_http_status(:found)
      expect(response.body).to include('redirected')
    end
  end
end
