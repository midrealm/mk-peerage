require 'rails_helper'
describe "get /chambers/laurel/poll/candidates/:id" do
  before(:each) do
    @candidate = create(:candidate, vote: true, peerage_type: :laurel)
  end
  describe "for active poll" do
    before(:each) do
      poll = create(:current_poll, peerage_type: :laurel)
    end
    describe "for logged in laurel" do
      before(:each) do
        @peer = create(:laurel_peer)
        sign_in(@peer.user)
      end
      it "shows candidate poll form" do
        get "/chambers/laurel/poll/candidates/#{@candidate.id}"
        expect(response).to have_http_status(:success)
        expect(response.body).to include("Poll for #{@candidate.sca_name}")
      end 
      it "shows comments for given candidate" do
        create(:comment, peer:@peer, candidate: @candidate, text: "I like this Candidate")
        get "/chambers/laurel/poll/candidates/#{@candidate.id}"
        expect(response.body).to include("I like this Candidate")
        expect(response.body).to include(@peer.sca_name)
      end
      it "shows advocates for given candidate" do
        advocate = create(:laurel_user, sca_name: 'Molly Mindingus')
        create(:advocacy, candidate: @candidate, peer: advocate.public_send(:laurel.to_s))
        get "/chambers/laurel/poll/candidates/#{@candidate.id}"
        expect(response.body).to include("Molly Mindingus")
      end
    end
    describe "for logged in non-laurel royal" do
      before(:each) do
        royal = create(:royal)
        sign_in(royal)
      end
      it "raises AccessDenied Error" do
        expect{get "/chambers/laurel/poll/candidates/#{@candidate.id}"}.to raise_error(CanCan::AccessDenied)
      end
    end
    describe "for non logged in guest" do
      it "redirects" do
        get "/chambers/laurel/poll/candidates/#{@candidate.id}"
        expect(response).to have_http_status(:found)
        expect(response.body).to include('redirected')
      end
    end
  end  
end
