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
        @peer = create(:laurel)
        sign_in(@peer)
      end
      it "shows candidate poll form" do
        get "/chambers/laurel/poll/candidates/#{@candidate.id}"
        expect(response).to have_http_status(:success)
        expect(response.body).to include("Poll for #{@candidate.sca_name}")
      end 
      it "shows comments for given candidate" do
        create(:comment, peer:@peer.public_send(:laurel.to_s), candidate: @candidate, text: "I like this Candidate")
        get "/chambers/laurel/poll/candidates/#{@candidate.id}"
        expect(response.body).to include("I like this Candidate")
        expect(response.body).to include(@peer.sca_name)
      end
      it "shows advocates for given candidate" do
        advocate = create(:laurel, sca_name: 'Molly Mindingus')
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
  describe "for active poll and past poll" do
    before(:each) do
      @past_poll = create(:past_poll, peerage_type: :laurel)
      @current_poll = create(:current_poll, peerage_type: :laurel)
    end
    describe "for logged in laurel" do
      before(:each) do
        @peer = create(:laurel)
        sign_in(@peer)
      end
      it "creates new advising for peer and candidate when there hasn't been a created advising" do
        expect(Advising.count).to eq(0)
        get "/chambers/laurel/poll/candidates/#{@candidate.id}"
        expect(Advising.count).to eq(1)
        expect(Advising.last.peer.id).to eq(@peer.public_send(:laurel.to_s).id)
        expect(Advising.last.candidate).to eq(@candidate)
      end
      it "pulls in old poll data into active poll" do
        @old_advising = create(:advising, poll: @past_poll, peer: @peer.public_send(:laurel.to_s), 
          candidate_id: @candidate.id, judgement: :elevate, comment: "This is my old comment")

          get "/chambers/laurel/poll/candidates/#{@candidate.id}"
          expect(response.body).to include("This is my old comment")
          expect(response.body).to include("<option selected=\"selected\" value=\"elevate\">Elevate to Peerage")
      end
      it "for pre edited poll, puts in pre edited stuff, not stuff from old poll" do
        @old_advising = create(:advising, poll_id: @past_poll.id, peer: @peer.public_send(:laurel.to_s), 
          candidate_id: @candidate.id, judgement: :elevate, comment: "This is my old comment")

        @new_advising = create(:advising, poll_id: nil, peer: @peer.public_send(:laurel.to_s), 
          candidate_id: @candidate.id, judgement: :drop, comment: "This is my new comment")
        
          get "/chambers/laurel/poll/candidates/#{@candidate.id}"
          expect(response.body).to include("This is my new comment")
          expect(response.body).to include("<option selected=\"selected\" value=\"drop\">Drop to Watch List")
      end
    end
  end
end
