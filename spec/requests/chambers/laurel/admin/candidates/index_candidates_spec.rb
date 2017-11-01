require "rails_helper"
describe "Get /chambers/laurel/admin/candidates" do
  it "shows list of candidates if admin user" do
    admin = create(:admin)
    sign_in(admin)
    get "/chambers/laurel/admin/candidates"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Manage Candidates')
  end
  it "redirects if not logged in" do
    get "/chambers/laurel/admin/candidates"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
  it "rasies AccessDenied Error if user is not an admin" do
    laurel = create(:user)
    sign_in(laurel)
    expect{get "/chambers/laurel/admin/candidates"}.to raise_error(CanCan::AccessDenied)
  end
end
