require "rails_helper"
describe "Get /chambers/pelican/admin/candidates/:id/edit" do
  before(:each) do
    @candidate = create(:candidate, sca_name: 'Dingus McDOOOGLE', peerage_type: :pelican)
  end
  context "for logged in pelican admin" do
    before(:each) do
      admin = create(:pelican_admin)
      sign_in(admin)
    end
    it "shows edit page for candidate" do
      get "/chambers/pelican/admin/candidates/#{@candidate.id}/edit"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Edit Candidate Dingus McDOOOGLE')
    end
    it "only shows potential Pelicans as Advocates" do
      create(:pelican, sca_name: 'Peter Pelican') 
      create(:user, sca_name: 'Lucy Laurel') 
      get "/chambers/pelican/admin/candidates/#{@candidate.id}/edit"
      expect(response.body).to include('Peter Pelican')
      expect(response.body).not_to include('Lucy Laurel')
    end
    it "throws error for editing non-pelican candidate" do
      laurel_candidate = create(:laurel_candidate)
      expect{get "/chambers/pelican/admin/candidates/#{laurel_candidate.id}/edit"}.to raise_error("Access Denied")
    end
  end
  context "for logged in non-pelican admin" do
    before(:each) do
      admin = create(:admin)
      sign_in(admin)
    end
    it "shows not authorized error" do
      expect{get "/chambers/pelican/admin/candidates/#{@candidate.id}/edit"}.to raise_error(CanCan::AccessDenied)
    end
  end
  it "redirects if not logged in" do
    get "/chambers/pelican/admin/candidates/#{@candidate.id}/edit"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
