require "rails_helper"
describe "Get /chambers/pelican/admin/candidates" do
  context "for logged in pelican admin" do
    before(:each) do
      admin = create(:pelican_admin)
      sign_in(admin)
    end
    it "shows list of candidates if admin user" do
      get "/chambers/pelican/admin/candidates"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Manage Candidates')
    end
    it "only shows pelican candidates" do
      candidate = create(:candidate, peerage_type: :pelican, sca_name: 'Peter Pelican')
      candidate2 = create(:candidate, peerage_type: :laurel, sca_name: 'Lindsey Laurel')
      get "/chambers/pelican/admin/candidates"
      expect(response.body).to include('Peter Pelican')
      expect(response.body).not_to include('Lindsey Laurel')
    end
  end 
  context "for logged in laurel admin" do
    before(:each) do
      admin = create(:admin)
      sign_in(admin)
    end
    it "raises AccessDenid Error" do
      expect{get "/chambers/pelican/admin/candidates"}.to raise_error(CanCan::AccessDenied)
    end
  end
  it "redirects if not logged in" do
    get "/chambers/pelican/admin/candidates"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
  it "rasies AccessDenied Error if user is not an admin" do
    pelican = create(:user)
    sign_in(pelican)
    expect{get "/chambers/pelican/admin/candidates"}.to raise_error(CanCan::AccessDenied)
  end
end
