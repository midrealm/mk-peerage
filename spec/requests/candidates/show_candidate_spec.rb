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
    it "shows candidate and their advocate" do
      advocate = create(:user, sca_name: 'Missy Examplemas')
      create(:advocacy, peer: advocate.peer, candidate: @candidate)
      get "/chambers/candidates/#{@candidate.id}"
      expect(response).to have_http_status(:success)
      expect(response.body).to include(@candidate.sca_name)
      expect(response.body).to include(advocate.sca_name)
    end

    it "shows candidate without and advocate" do
      get "/chambers/candidates/#{@candidate.id}"
      expect(response).to have_http_status(:success)
      expect(response.body).to include(@candidate.sca_name)
    end
    it "shows comments" do
      create(:comment, peer: @laurel.peer, candidate: @candidate, text: "I like this candidate")
      get "/chambers/candidates/#{@candidate.id}"
      expect(response.body).to include(@laurel.sca_name)
      expect(response.body).to include("I like this candidate")
    end
  end
  it "redirects if not logged in" do
    get "/chambers/poll"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
