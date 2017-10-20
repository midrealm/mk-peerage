require 'rails_helper'
describe "Get /chambers/candidates/:id" do
  before(:each) do
    @candidate = create(:candidate)
  end
  context "logged in laurel" do
    before(:each) do
      @laurel = create(:user)
      sign_in(@laurel)
    end
    it "shows candidate" do
      get "/chambers/candidates/#{@candidate.id}"
      expect(response).to have_http_status(:success)
      expect(response.body).to include(@candidate.sca_name)
    end
  end
  it "redirects if not logged in" do
    get "/chambers/poll"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
