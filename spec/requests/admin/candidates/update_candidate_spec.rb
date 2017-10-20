require "rails_helper"
describe "put /chambers/admin/candidates/:id" do
  it "edits profile for signed in laurel, and redirects to profile page" do
    admin = create(:admin)
    candidate = create(:candidate, sca_name: 'Dingus McDOOOOgle')
    sign_in(admin)

    expect(Candidate.first.sca_name).to eq('Dingus McDOOOOgle')
    put "/chambers/admin/candidates/#{candidate.id}", params: { :candidate => {sca_name: 'Milly Snoodle'} }
    expect(Candidate.first.sca_name).to eq('Milly Snoodle')
    expect(response).to redirect_to "/chambers/candidates/#{candidate.id}"
  end
  it "redirects if not logged in" do
    candidate = create(:candidate, sca_name: 'Dingus McDOOOOgle')
    put "/chambers/admin/candidates/#{candidate.id}", params: { :candidate => {sca_name: 'Milly Snoodle'} }
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
