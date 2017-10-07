require "rails_helper"
describe "Get /users/edit" do
  it "shows edit page for laurel" do
    laurel = create(:user, sca_name: 'Mundugus Jones')
    peer = create(:peer, type: 'Laurel', user: laurel)
    sign_in(laurel)
    get "/users/edit"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Edit Profile')
  end
  it "redirects if not logged in" do
    get "/users/edit"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
