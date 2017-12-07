require "rails_helper"
describe "Get /chambers/laurel/admin/laurels" do
  it "shows list of laurels if admin user" do
    admin = create(:admin)
    sign_in(admin)
    get "/chambers/laurel/admin/laurels"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Manage Laurels')
  end
  it "does not show royals" do
    admin = create(:admin, sca_name: 'Default Laurel')
    royalty = create(:royal, sca_name: 'Duke Ducky')
    sign_in(admin)
    get "/chambers/laurel/admin/laurels"
    expect(response.body).to include('Default Laurel')
    expect(response.body).not_to include('Duke Ducky')
  end
  it "does not show non-laurel peers" do
    admin = create(:admin, sca_name: 'Default Laurel')
    pelican = create(:pelican, sca_name: 'Peter Pelican')
    sign_in(admin)
    get "/chambers/laurel/admin/laurels"
    expect(response.body).to include('Default Laurel')
    expect(response.body).not_to include('Peter Pelican')
  end
  it "redirects if not logged in" do
    get "/chambers/laurel/admin/laurels"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
  it "rasies AccessDenied Error if user is not an admin" do
    laurel = create(:user)
    sign_in(laurel)
    expect{get "/chambers/laurel/admin/laurels"}.to raise_error(CanCan::AccessDenied)
  end
end
