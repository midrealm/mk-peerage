require 'rails_helper'
describe "Get /chambers/laurel/candidates/:id" do
  before(:each) do
    @candidate = create(:candidate, peerage_type: :laurel)
  end
  context "logged in laurel" do
    before(:each) do
      @peer = create(:laurel_peer)
      sign_in(@peer.user)
    end
    it "shows candidate and their advocate" do
      advocate = create(:laurel_user, sca_name: 'Missy Examplemas')
      create(:advocacy, peer: advocate.public_send(:laurel.to_s), candidate: @candidate)
      get "/chambers/laurel/candidates/#{@candidate.id}"
      expect(response).to have_http_status(:success)
      expect(response.body).to include(@candidate.sca_name)
      expect(response.body).to include(advocate.sca_name)
    end

    it "shows candidate without and advocate" do
      get "/chambers/laurel/candidates/#{@candidate.id}"
      expect(response).to have_http_status(:success)
      expect(response.body).to include(@candidate.sca_name)
    end
    it "shows comments" do
      create(:comment, peer: @peer, candidate: @candidate, text: "I like this candidate")
      get "/chambers/laurel/candidates/#{@candidate.id}"
      expect(response.body).to include(@peer.sca_name)
      expect(response.body).to include("I like this candidate")
    end
  end
  it "redirects if not logged in" do
    get "/chambers/laurel/candidates/#{@candidate.id}"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
