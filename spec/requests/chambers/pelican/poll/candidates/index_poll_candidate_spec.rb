require 'rails_helper'
describe "Get /chambers/pelican/poll" do
  describe "logged in pelican" do
    before(:each) do
      @pelican = create(:pelican)
      sign_in(@pelican)
    end
    describe "current poll" do
      before(:each) do
        @poll = create(:current_poll, peerage_type: :pelican)
        @candidate1 = create(:candidate, sca_name: "Candidate1", peerage_type: :pelican)
        @candidate2 = create(:candidate, sca_name: "Candidate2", peerage_type: :pelican)
      end
      it "shows poll" do
        get '/chambers/pelican/poll'
        expect(response).to have_http_status(:success)
        expect(response.body).to include('Poll')
      end
      it "shows list of candidates" do
        get '/chambers/pelican/poll'
        expect(response.body).to include(@candidate1.sca_name)
        expect(response.body).to include(@candidate2.sca_name)
      end
      it "only shows pelican candidates" do
        laurel_candidate = create(:candidate, peerage_type: :laurel, sca_name: 'Lucy Laurel')
        get '/chambers/pelican/poll'
        expect(response.body).not_to include(laurel_candidate.sca_name)
      end

      it "shows OK if advising has been submitted for a given candidate" do
        advising = create(:advising, poll: @poll, candidate: @candidate1, peer: @pelican.pelican, submitted: true)
        get '/chambers/pelican/poll'
        expect(response.body).to include('glyphicon-ok')
      end
      it "does not shows OK if advising has not been submitted for a given candidate" do
        get '/chambers/pelican/poll'
        expect(response.body).not_to include('glyphicon-ok')
      end

      it "show progress bar with percent of candidates complete" do
        advising = create(:advising, poll: @poll, candidate: @candidate1, peer: @pelican.pelican, submitted: true)
        get '/chambers/pelican/poll'
        expect(response.body).to include('width: 50%')
        expect(response.body).to include('progress-bar')
    
      end
      it "shows how many have poll entries have been submitted" do
        advising = create(:advising, poll: @poll, candidate: @candidate1, peer: @pelican.pelican, submitted: true)
        get '/chambers/pelican/poll'
        expect(response.body).to include('1/2 Submitted')
      end
    end
    describe "past poll" do
      before(:each) do
        poll = create(:past_poll, peerage_type: :pelican)
      end
      it "redirects to chambers" do
        get '/chambers/pelican/poll'
        expect(response).to redirect_to "/chambers"
      end
    end
    describe "future poll" do
      before(:each) do
        poll = create(:future_poll, peerage_type: :pelican) 
      end
      it "redirects to chambers" do
        get '/chambers/pelican/poll'
        expect(response).to redirect_to "/chambers"
      end
    end
  end  
  describe "logged in non-pelican royal" do
    before(:each) do
      royal = create(:royal)
      sign_in(royal)
    end
    it "raises AccessDenied Error if user is not admin" do
        poll = create(:current_poll, peerage_type: :pelican)
        expect{get "/chambers/pelican/poll"}.to raise_error(CanCan::AccessDenied)
    end
  end
  describe "guest users" do
    it "redirects if not logged in" do
      get "/chambers/pelican/poll"
      expect(response).to have_http_status(:found)
      expect(response.body).to include('redirected')
    end
  end
end
