require 'rails_helper'
describe "Get /chambers/laurel/poll/candidates/:id" do
  before(:each) do
    @candidate = create(:candidate, vote: true)
  end
  describe "for active poll" do
    before(:each) do
      poll = build(:poll, start_date: DateTime.now - 1.day, end_date: DateTime.now + 1.day)
      poll.save(validate: false)
    end
    describe "for logged in laurel" do
      before(:each) do
        @laurel = create(:user)
        sign_in(@laurel)
      end
      it "shows candidate poll form" do
        get "/chambers/laurel/poll/candidates/#{@candidate.id}"
        expect(response).to have_http_status(:success)
        expect(response.body).to include("Poll for #{@candidate.sca_name}")
      end 
      it "shows comments for given candidate" do
        create(:comment, peer:@laurel.laurel, candidate: @candidate, text: "I like this Candidate")
        get "/chambers/laurel/poll/candidates/#{@candidate.id}"
        expect(response.body).to include("I like this Candidate")
        expect(response.body).to include(@laurel.sca_name)
      end
      it "shows advocates for given candidate" do
        advocate = create(:user, sca_name: 'Molly Mindingus')
        create(:advocacy, candidate: @candidate, peer: advocate.laurel)
        get "/chambers/laurel/poll/candidates/#{@candidate.id}"
        expect(response.body).to include("Molly Mindingus")
      end
    end
    context "for logged in non-laurel pelican" do
      before(:each) do
        pelican = create(:pelican)
        sign_in(pelican)
      end
      it "raises AccessDenied Error" do
        expect{get "/chambers/laurel/poll/candidates/#{@candidate.id}"}.to raise_error(CanCan::AccessDenied)
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
      @past_poll = build(:poll, start_date: DateTime.now - 5.days, end_date: DateTime.now - 4.days)
      @past_poll.save(validate: false)
      @current_poll = build(:poll, start_date: DateTime.now - 1.day, end_date: DateTime.now + 1.day)
      @current_poll.save(validate: false)
    end
    describe "for logged in laurel" do
      before(:each) do
        @laurel = create(:user)
        sign_in(@laurel)
      end
      it "creates new advising for peer and candidate when there hasn't been a created advising" do
        expect(Advising.count).to eq(0)
        get "/chambers/laurel/poll/candidates/#{@candidate.id}"
        expect(Advising.count).to eq(1)
        expect(Advising.last.peer.id).to eq(@laurel.laurel.id)
        expect(Advising.last.candidate).to eq(@candidate)
      end
      it "pulls in old poll data into active poll" do
        @old_advising = create(:advising, poll: @past_poll, peer: @laurel.laurel, 
          candidate_id: @candidate.id, judgement: :elevate, comment: "This is my old comment")

          get "/chambers/laurel/poll/candidates/#{@candidate.id}"
          expect(response.body).to include("This is my old comment")
          expect(response.body).to include("<option selected=\"selected\" value=\"elevate\">Elevate to Peerage")
      end
      it "for pre edited poll, puts in pre edited stuff, not stuff from old poll" do
        @old_advising = create(:advising, poll_id: @past_poll.id, peer: @laurel.laurel, 
          candidate_id: @candidate.id, judgement: :elevate, comment: "This is my old comment")

        @new_advising = create(:advising, poll_id: nil, peer: @laurel.laurel, 
          candidate_id: @candidate.id, judgement: :drop, comment: "This is my new comment")
        
          get "/chambers/laurel/poll/candidates/#{@candidate.id}"
          expect(response.body).to include("This is my new comment")
          expect(response.body).to include("<option selected=\"selected\" value=\"drop\">Drop to Watch List")
      end
    end
  end
end
