shared_examples_for "get /chambers/PEERAGE/admin/candidates/new" do |peerage, other_peerage|
  describe "Get /chambers/#{peerage}/admin/candidates/new" do
    it "rasies AccessDenied Error if user is not an #{peerage} admin" do
      other_peerage_admin = create("#{other_peerage}_admin".to_sym)
      sign_in(other_peerage_admin)
      expect{get "/chambers/#{peerage}/admin/candidates/new"}.to raise_error(CanCan::AccessDenied)
    end
  end
end
