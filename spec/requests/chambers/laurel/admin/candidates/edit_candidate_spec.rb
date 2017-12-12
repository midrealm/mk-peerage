require "rails_helper"
describe "Get /chambers/laurel/admin/candidates/:id/edit" do
  before(:each) do
    @candidate = create(:laurel_candidate, sca_name: 'Dingus McDOOOGLE')
  end
  context "for logged in laurel admin" do
    before(:each) do
      admin = create(:admin)
      sign_in(admin)
    end
    it "shows edit page for candidate" do
      get "/chambers/laurel/admin/candidates/#{@candidate.id}/edit"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Edit Candidate Dingus McDOOOGLE')
    end
    it "throws error for editing non-laurel candidate" do
      pelican_candidate = create(:pelican_candidate)
      expect{get "/chambers/laurel/admin/candidates/#{pelican_candidate.id}/edit"}.to raise_error("Access Denied")
    end
  end
  context "for logged in non-laurel admin" do
    before(:each) do
      admin = create(:pelican_admin)
      sign_in(admin)
    end
    it "shows not authorized error" do
      expect{get "/chambers/laurel/admin/candidates/#{@candidate.id}/edit"}.to raise_error(CanCan::AccessDenied)
    end
  end
  it "redirects if not logged in" do
    candidate = create(:candidate, sca_name: 'Dingus McDOOOGLE')
    get "/chambers/laurel/admin/candidates/#{candidate.id}/edit"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
