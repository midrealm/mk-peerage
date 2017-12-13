require "rails_helper"
describe "Get /chambers/pelican/admin/pelicans" do
  context "for pelican admin" do
    before(:each) do
      admin = create(:pelican_admin, sca_name: 'Peter Pelican')
      sign_in(admin)
    end
    it "shows list of pelicans if admin user" do
      get "/chambers/pelican/admin/pelicans"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Manage Pelicans')
    end
    it "does not show royals" do
      royalty = create(:royal, sca_name: 'Duke Ducky')
      get "/chambers/pelican/admin/pelicans"
      expect(response.body).to include('Peter Pelican')
      expect(response.body).not_to include('Duke Ducky')
    end
    it "does not show non-pelican peers" do
      laurel = create(:user, sca_name: 'Lucy Laurel')
      get "/chambers/pelican/admin/pelicans"
      expect(response.body).to include('Peter Pelican')
      expect(response.body).not_to include('Lucy Laurel')
    end
  end
  it "redirects if not logged in" do
    get "/chambers/pelican/admin/pelicans"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
  it "rasies AccessDenied Error if user is not an admin" do
    pelican = create(:pelican)
    sign_in(pelican)
    expect{get "/chambers/pelican/admin/pelicans"}.to raise_error(CanCan::AccessDenied)
  end
end
