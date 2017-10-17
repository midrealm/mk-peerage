require "rails_helper"
describe "Get /chambers/admin/candidates/new" do
  it "shows form for new user if admin user" do
    admin = create(:admin)
    sign_in(admin)
    get "/chambers/admin/candidates/new"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Add New Candidate')
  end
  it "redirects if not logged in" do
    get "/chambers/admin/candidates/new"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
  it "rasies AccessDenied Error if user is not an admin" do
    laurel = create(:user)
    sign_in(laurel)
    expect{get "/chambers/admin/candidates/new"}.to raise_error(CanCan::AccessDenied)
  end
end
