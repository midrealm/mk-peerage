shared_examples_for "get /chambers/PEERAGE/admin/candidates" do |peerage, other_peerage|
  describe "Get /chambers/#{peerage}/admin/candidates" do
    context "for logged in #{peerage} admin" do
      before(:each) do
        admin = create("#{peerage}_admin".to_sym)
        sign_in(admin)
      end
      it "only shows #{peerage} candidates" do
        candidate = create(:candidate, peerage_type: peerage.to_sym, sca_name: 'Peter Peerage')
        candidate2 = create(:candidate, peerage_type: other_peerage.to_sym, sca_name: 'Octavia Other-Peerage')
        get "/chambers/#{peerage}/admin/candidates"
        expect(response.body).to include('Peter Peerage')
        expect(response.body).not_to include('Octavia Other-Peerage')
      end
    end 
    context "for logged in #{other_peerage} admin" do
      before(:each) do
        admin = create("#{other_peerage}_admin".to_sym)
        sign_in(admin)
      end
      it "raises AccessDenid Error" do
        expect{get "/chambers/#{peerage}/admin/candidates"}.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
