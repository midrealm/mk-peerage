require "rails_helper"
describe "put /chambers/pelican/admin/candidates/:id" do
  before(:each) do
    @candidate = create(:candidate, sca_name: 'Dingus McDOOOOgle', peerage_type: :pelican)
  end
  context "for signed in admin pelican" do
    before(:each) do
      admin = create(:pelican_admin)
      sign_in(admin)
    end
    it "edits profile for signed in pelican, and redirects to profile page" do
      expect(Candidate.first.sca_name).to eq('Dingus McDOOOOgle')
      put "/chambers/pelican/admin/candidates/#{@candidate.id}", params: { :candidate => {sca_name: 'Milly Snoodle'} }
      expect(Candidate.first.sca_name).to eq('Milly Snoodle')
      expect(response).to redirect_to "/chambers/pelican/candidates/#{@candidate.id}"
    end
  end
  it "redirects if not logged in" do
    put "/chambers/pelican/admin/candidates/#{@candidate.id}", params: { :candidate => {sca_name: 'Milly Snoodle'} }
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
