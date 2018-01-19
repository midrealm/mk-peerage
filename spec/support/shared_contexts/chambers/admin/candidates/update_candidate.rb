shared_examples_for "put /chambers/PEERAGE/admin/candidates/:id" do |peerage, other_peerage|
  describe "put /chambers/#{peerage}/admin/candidates/:id" do
    before(:each) do
      @candidate = create(:candidate, sca_name: 'Dingus McDOOOOgle', peerage_type: peerage.to_sym)
    end
    context "for signed in admin #{peerage}" do
      before(:each) do
        admin = create("#{peerage}_admin".to_sym)
        sign_in(admin)
      end
      it "throws error for editing non-#{peerage} candidate" do
        other_peerage_candidate = create("#{other_peerage}_candidate".to_sym)
        expect{put "/chambers/#{peerage}/admin/candidates/#{other_peerage_candidate.id}", params: { :candidate => {sca_name: 'Milly Snoodle'} }}.to raise_error("Access Denied")
      end
    end
  
    context "for logged in non-#{peerage} admin" do
      before(:each) do
        admin = create("#{other_peerage}_admin".to_sym)
        sign_in(admin)
      end
      it "shows not authorized error" do
        expect{put "/chambers/#{peerage}/admin/candidates/#{@candidate.id}", params: { :candidate => {sca_name: 'Milly Snoodle'} }}.to raise_error(CanCan::AccessDenied)
      end
    end
  end
end
