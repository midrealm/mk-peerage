require "rails_helper"
describe "Get /chambers/pelican/admin/pelicans/new" do
  it "shows form for new user if pelican admin user" do
    admin = create(:pelican_admin)
    sign_in(admin)
    get "/chambers/pelican/admin/pelicans/new"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Add New Pelican')
  end
  it "redirects if not logged in" do
    get "/chambers/pelican/admin/pelicans/new"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
  it "rasies AccessDenied Error if user is not an admin" do
    pelican = create(:pelican)
    sign_in(pelican)
    expect{get "/chambers/pelican/admin/pelicans/new"}.to raise_error(CanCan::AccessDenied)
  end
  it "rasies AccessDenied Error if user is not a pelican" do
    laurel = create(:user)
    sign_in(laurel)
    expect{get "/chambers/pelican/admin/pelicans/new"}.to raise_error(CanCan::AccessDenied)
  end
end
