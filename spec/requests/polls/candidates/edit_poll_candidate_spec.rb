require 'rails_helper'
describe "Get /chambers/poll/candidates/:id/new" do
  before(:each) do
    @candidate = create(:candidate)
  end
  describe "for active poll" do
    before(:each) do
      poll = build(:poll, start_date: DateTime.now - 1.day, end_date: DateTime.now + 1.day)
      poll.save(validate: false)
    end
    describe "for logged in laurel" do
      before(:each) do
        laurel = create(:user)
        sign_in(laurel)
      end
      it "shows candidate poll form" do
        get "/chambers/poll/candidates/#{@candidate.id}"
        expect(response).to have_http_status(:success)
        expect(response.body).to include("Poll for #{@candidate.sca_name}")
      end 
      it "shows advocates for given candidate" do
        advocate = create(:user, sca_name: 'Molly Mindingus')
        create(:advocacy, candidate: @candidate, peer: advocate.peer)
        get "/chambers/poll/candidates/#{@candidate.id}"
        expect(response.body).to include("Molly Mindingus")
      end
    end
    describe "for logged in non-laurel royal" do
      before(:each) do
        royal = create(:royal)
        sign_in(royal)
      end
      it "raises AccessDenied Error" do
        expect{get "/chambers/poll/candidates/#{@candidate.id}"}.to raise_error(CanCan::AccessDenied)
      end
    end
    describe "for non logged in guest" do
      it "redirects" do
        get "/chambers/poll/candidates/#{@candidate.id}"
        expect(response).to have_http_status(:found)
        expect(response.body).to include('redirected')
      end
    end
  end  
  describe "for active poll and past poll" do
    before(:each) do
      @past_poll = build(:poll, start_date: DateTime.now - 5.days, end_date: DateTime.now - 4.days)
      @past_poll.save(validate: false)
      @current_poll = build(:poll, start_date: DateTime.now - 1.day, end_date: DateTime.now + 1.day)
      @current_poll.save(validate: false)
      @judgement1 = create(:judgement)
      @judgement2 = create(:judgement, name: "some other judgement")
    end
    describe "for logged in laurel" do
      before(:each) do
        @laurel = create(:user)
        sign_in(@laurel)
      end
      it "creates new advising for peer and candidate when there hasn't been a created advising" do
        expect(Advising.count).to eq(0)
        get "/chambers/poll/candidates/#{@candidate.id}"
        expect(Advising.count).to eq(1)
        expect(Advising.last.peer).to eq(@laurel.peer)
        expect(Advising.last.candidate).to eq(@candidate)
      end
      it "pulls in old poll data into active poll" do
        @old_advising = create(:advising, poll: @past_poll, peer: @laurel.peer, 
          candidate_id: @candidate.id, judgement_id: @judgement2.id, comment: "This is my old comment")

          get "/chambers/poll/candidates/#{@candidate.id}"
          expect(response.body).to include("This is my old comment")
          expect(response.body).to include("<option selected=\"selected\" value=\"#{@judgement2.id}\">#{@judgement2.name}")
      end
      it "for pre edited poll, puts in pre edited stuff, not stuff from old poll" do
        @old_advising = create(:advising, poll_id: @past_poll.id, peer: @laurel.peer, 
          candidate_id: @candidate.id, judgement_id: @judgement2.id, comment: "This is my old comment")

        @new_advising = create(:advising, poll_id: nil, peer: @laurel.peer, 
          candidate_id: @candidate.id, judgement_id: @judgement1.id, comment: "This is my new comment")
        
          get "/chambers/poll/candidates/#{@candidate.id}"
          expect(response.body).to include("This is my new comment")
          expect(response.body).to include("<option selected=\"selected\" value=\"#{@judgement1.id}\">#{@judgement1.name}")
      end
    end
  end
end
