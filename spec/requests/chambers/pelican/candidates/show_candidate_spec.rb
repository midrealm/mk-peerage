require 'rails_helper'
describe "Get /chambers/pelican/candidates/:id" do
  before(:each) do
    @candidate = create(:candidate, peerage_type: :pelican)
  end
  context "logged in pelican" do
    before(:each) do
      @pelican = create(:pelican)
      sign_in(@pelican)
    end
    it "shows candidate and their advocate" do
      advocate = create(:pelican, sca_name: 'Missy Examplemas')
      create(:advocacy, peer: advocate.peer, candidate: @candidate)
      get "/chambers/pelican/candidates/#{@candidate.id}"
      expect(response).to have_http_status(:success)
      expect(response.body).to include(@candidate.sca_name)
      expect(response.body).to include(advocate.sca_name)
    end

    it "shows candidate without and advocate" do
      get "/chambers/pelican/candidates/#{@candidate.id}"
      expect(response).to have_http_status(:success)
      expect(response.body).to include(@candidate.sca_name)
    end
    it "shows comments" do
      create(:comment, peer: @pelican.peer, candidate: @candidate, text: "I like this candidate")
      get "/chambers/pelican/candidates/#{@candidate.id}"
      expect(response.body).to include(@pelican.sca_name)
      expect(response.body).to include("I like this candidate")
    end
    it "throws error for showing non-pelican candidate" do
      laurel_candidate = create(:laurel_candidate)
      expect{get "/chambers/pelican/candidates/#{laurel_candidate.id}"}.to raise_error("Access Denied")
    end
  end
  context "logged in laurel (non-pelican)" do
    before(:each) do
      @laurel = create(:user)
      sign_in(@laurel)
    end
    it "shows not authorized error for non-pelican user" do
      expect{get "/chambers/pelican/candidates/#{@candidate.id}"}.to raise_error(CanCan::AccessDenied)
    end
  end
  it "redirects if not logged in" do
    get "/chambers/pelican/candidates/#{@candidate.id}"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
