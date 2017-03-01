require "rails_helper"
describe "Get /chambers/candidates" do
  it "shows list of candidates" do
    laurel = create(:user, sca_name: 'Mundugus Jones')
    sign_in(laurel)
    get "/chambers/candidates"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Candidates')
  end
  it "redirects if not logged in" do
    get "/chambers/candidates"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
