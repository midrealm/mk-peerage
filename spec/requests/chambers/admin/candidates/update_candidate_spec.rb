require 'rails_helper'
describe "put /chambers/laurel/admin/candidates/:id" do
  before(:each) do
    @candidate = create(:candidate, sca_name: 'Dingus McDOOOOgle', peerage_type: :laurel)
  end
  context "for signed in admin laurel" do
    before(:each) do
      admin = create("laurel_admin".to_sym)
      sign_in(admin)
    end
    it "edits profile for signed in laurel, and redirects to profile page" do
      expect(Candidate.first.sca_name).to eq('Dingus McDOOOOgle')
      put "/chambers/laurel/admin/candidates/#{@candidate.id}", params: { :candidate => {sca_name: 'Milly Snoodle'} }
      expect(Candidate.first.sca_name).to eq('Milly Snoodle')
      expect(response).to redirect_to "/chambers/laurel/candidates/#{@candidate.id}"
    end
  end

  it "redirects if not logged in" do
    put "/chambers/laurel/admin/candidates/#{@candidate.id}", params: { :candidate => {sca_name: 'Milly Snoodle'} }
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
