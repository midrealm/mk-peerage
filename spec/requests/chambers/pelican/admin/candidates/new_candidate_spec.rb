require "rails_helper"
describe "Get /chambers/admin/candidates/new" do
  it "shows form for new user if admin user" do
    admin = create(:pelican_admin)
    sign_in(admin)
    get "/chambers/pelican/admin/candidates/new"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Add New Candidate')
  end
  it "redirects if not logged in" do
    get "/chambers/pelican/admin/candidates/new"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
  it "rasies AccessDenied Error if user is not an admin" do
    pelican = create(:pelican)
    sign_in(pelican)
    expect{get "/chambers/pelican/admin/candidates/new"}.to raise_error(CanCan::AccessDenied)
  end
  it "rasies AccessDenied Error if user is not an pelican admin" do
    laurel_admin = create(:admin)
    sign_in(laurel_admin)
    expect{get "/chambers/pelican/admin/candidates/new"}.to raise_error(CanCan::AccessDenied)
  end
end
