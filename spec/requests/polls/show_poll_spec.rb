require 'rails_helper'
describe "Get /chambers/poll" do
  describe "logged in laurel" do
    before(:each) do
      @laurel = create(:user)
      sign_in(@laurel)
    end
    describe "current poll" do
      before(:each) do
        @poll = build(:poll, start_date: DateTime.now - 1.day, end_date: DateTime.now + 1.day)
        @poll.save(validate: false)
        @candidate1 = create(:candidate, sca_name: "Candidate1")
        @candidate2 = create(:candidate, sca_name: "Candidate2")
      end
      it "shows poll" do
        get '/chambers/poll'
        expect(response).to have_http_status(:success)
        expect(response.body).to include('Poll')
      end
      it "shows list of candidates" do
        get '/chambers/poll'
        expect(response.body).to include(@candidate1.sca_name)
        expect(response.body).to include(@candidate2.sca_name)
      end

      it "shows OK if advising has been submitted for a given candidate" do
        advising = create(:advising, poll: @poll, candidate: @candidate1, user: @laurel, submitted: true)
        get '/chambers/poll'
        expect(response.body).to include('glyphicon-ok')
      end
      it "does not shows OK if advising has not been submitted for a given candidate" do
        get '/chambers/poll'
        expect(response.body).not_to include('glyphicon-ok')
      end

      it "show progress bar with percent of candidates complete" do
        advising = create(:advising, poll: @poll, candidate: @candidate1, user: @laurel, submitted: true)
        get '/chambers/poll'
        expect(response.body).to include('width: 50%')
        expect(response.body).to include('progress-bar')
    
      end
      it "shows how many have poll entries have been submitted" do
        advising = create(:advising, poll: @poll, candidate: @candidate1, user: @laurel, submitted: true)
        get '/chambers/poll'
        expect(response.body).to include('1/2 Submitted')
      end
    end
    describe "past poll" do
      before(:each) do
        poll = build(:poll, start_date: DateTime.now - 2.days, end_date: DateTime.now - 1.days)
        poll.save(validate: false)
      end
      it "redirects to chambers" do
        get '/chambers/poll'
        expect(response).to redirect_to "/chambers"
      end
    end
    describe "future poll" do
      before(:each) do
        poll = create(:poll, start_date: DateTime.now + 2.days, end_date: DateTime.now + 3.days)
      end
      it "redirects to chambers" do
        get '/chambers/poll'
        expect(response).to redirect_to "/chambers"
      end
    end
  end  
  describe "logged in non-laurel royal" do
    before(:each) do
      royal = create(:royal)
      sign_in(royal)
    end
    it "raises AccessDenied Error if user is not admin" do
        poll = build(:poll, start_date: DateTime.now - 1.day, end_date: DateTime.now + 1.day)
        poll.save(validate: false)
        expect{get "/chambers/poll"}.to raise_error(CanCan::AccessDenied)
    end
  end
  describe "guest users" do
    it "redirects if not logged in" do
      get "/chambers/poll"
      expect(response).to have_http_status(:found)
      expect(response.body).to include('redirected')
    end
  end
end
