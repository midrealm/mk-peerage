require "rails_helper"
describe "put /chambers/admin/candidates/:id" do
  before(:each) do
    @candidate = create(:laurel_candidate, sca_name: 'Dingus McDOOOGLE')
  end
  context "for logged in laurel admin" do
    before(:each) do
      admin = create(:admin)
      sign_in(admin)
    end
    it "edits profile for signed in laurel, and redirects to profile page" do
      expect(Candidate.first.sca_name).to eq('Dingus McDOOOGLE')
      put "/chambers/laurel/admin/candidates/#{@candidate.id}", params: { :candidate => {sca_name: 'Milly Snoodle'} }
      expect(Candidate.first.sca_name).to eq('Milly Snoodle')
      expect(response).to redirect_to "/chambers/laurel/candidates/#{@candidate.id}"
    end
    it "throws error for editing non-laurel candidate" do
      pelican_candidate = create(:pelican_candidate)
      expect{put "/chambers/laurel/admin/candidates/#{pelican_candidate.id}", params: { :candidate => {sca_name: 'Milly Snoodle'} }}.to raise_error("Access Denied")
    end
  end
  context "for logged in non-laurel admin" do
    before(:each) do
      admin = create(:pelican_admin)
      sign_in(admin)
    end
    it "shows not authorized error" do
      expect{put "/chambers/laurel/admin/candidates/#{@candidate.id}", params: { :candidate => {sca_name: 'Milly Snoodle'} }}.to raise_error(CanCan::AccessDenied)
    end
  end
  it "redirects if not logged in" do
    put "/chambers/laurel/admin/candidates/#{@candidate.id}", params: { :candidate => {sca_name: 'Milly Snoodle'} }
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
