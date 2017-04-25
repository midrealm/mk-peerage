require "rails_helper"
describe "Get /chambers" do
  it "shows dashboard for logged in user" do
    laurel = create(:user)
    sign_in(laurel)
    get "/chambers"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Edit Your Profile')
  end
  it "shows Admin Tasks for admin user" do
    admin = create(:user, role: :admin)
    sign_in(admin)
    get "/chambers"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Admin Tasks')
  end
  it "does not show Admin Tasks for normal user" do
    laurel = create(:user, role: :normal)
    sign_in(laurel)
    get "/chambers"
    expect(response).to have_http_status(:success)
    expect(response.body).not_to include('Admin Tasks')
  end
  it "redirects if not logged in" do
    get "/chambers"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
