require "rails_helper"
describe "delete /chambers/pelican/admin/candidates/:id" do
  before(:each) do
    @candidate = create(:candidate, sca_name: 'Dingus McDOOOOgle', peerage_type: :pelican)
  end
  context "for signed in admin pelican" do
    before(:each) do
      admin = create(:pelican_admin)
      sign_in(admin)
    end
    it "deletes pelican candidate" do
      expect(Candidate.count).to eq(1)
      delete "/chambers/pelican/admin/candidates/#{@candidate.id}"
      expect(Candidate.count).to eq(0)
    end
    it "redirects to candidates admin path" do
      delete "/chambers/pelican/admin/candidates/#{@candidate.id}"
      expect(response).to redirect_to('/chambers/pelican/admin/candidates')
    end
  end
  it "redirects if not logged in" do
    delete "/chambers/pelican/admin/candidates/#{@candidate.id}"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
