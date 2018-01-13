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
      it "edits profile for signed in #{peerage}, and redirects to profile page" do
        expect(Candidate.first.sca_name).to eq('Dingus McDOOOOgle')
        put "/chambers/#{peerage}/admin/candidates/#{@candidate.id}", params: { :candidate => {sca_name: 'Milly Snoodle'} }
        expect(Candidate.first.sca_name).to eq('Milly Snoodle')
        expect(response).to redirect_to "/chambers/#{peerage}/candidates/#{@candidate.id}"
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
    it "redirects if not logged in" do
      put "/chambers/#{peerage}/admin/candidates/#{@candidate.id}", params: { :candidate => {sca_name: 'Milly Snoodle'} }
      expect(response).to have_http_status(:found)
      expect(response.body).to include('redirected')
    end
  end
end
