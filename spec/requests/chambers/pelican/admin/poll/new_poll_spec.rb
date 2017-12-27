require "rails_helper"
describe "Get /chambers/pelican/admin/poll/new" do
  it "shows form for new user if admin user" do
    admin = create(:pelican_admin)
    sign_in(admin)
    get "/chambers/pelican/admin/poll/new"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Create New Pelican Poll')
  end
  it "redirects if not logged in" do
    get "/chambers/pelican/admin/poll/new"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
  it "rasies AccessDenied Error if user is not an admin" do
    pelican = create(:pelican)
    sign_in(pelican)
    expect{get "/chambers/pelican/admin/poll/new"}.to raise_error(CanCan::AccessDenied)
  end
end
