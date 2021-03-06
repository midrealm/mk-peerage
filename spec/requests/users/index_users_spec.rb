require "rails_helper"

describe "Get /chambers" do
  describe "loggin in super user" do
    before(:each) do
      superuser = create(:laurel_user, superuser: true)
      sign_in(superuser)
    end
    it "sees Laurel Candidates" do
      get "/chambers"
      expect(response.body).to include('/chambers/laurel/candidates')
    end
    it "sees Laurel Admin" do
      get "/chambers"
      expect(response.body).to include('Manage Laurels')
    end
    it "sees Pelican Admin" do
      get "/chambers"
      expect(response.body).to include('Manage Pelicans')
    end
    it "does not see Pelican Candidates" do
      get "/chambers"
      expect(response.body).not_to include('/chambers/pelican/candidates')
    end
  end
  describe "logged in non-royal" do
    before(:each) do
      peer = create(:laurel_user)
      sign_in(peer)
    end
    it "shows dashboard for logged in user" do
      get "/chambers"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Edit Your Profile')
    end
    it "shows link to candidates" do
      get "/chambers"
      expect(response.body).to include('/chambers/laurel/candidates')
    end
    it "shows Laurel specialties" do
      get "/chambers"
      expect(response.body).to include('/chambers/laurel/specialties')
    end
    it "does not show Admin Tasks" do
      get "/chambers"
      expect(response).to have_http_status(:success)
      expect(response.body).not_to include('Admin Tasks')
    end
    it "shows news" do
      news = create(:laurel_news, body: 'There is some new News')
      get "/chambers"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('There is some new News')
    end
  end
  describe "admin user" do
    before(:each) do
      admin = create(:admin)
      sign_in(admin)
    end
    it "shows Admin Tasks" do
      get "/chambers"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Admin Tasks')
    end
    it "shows 'Edit News'" do
      get "/chambers"
      expect(response.body).to include('Edit News')
    end
    it "shows 'Manage Polls'" do
      get "/chambers"
      expect(response.body).to include('Manage Polls')
    end
  end
  it "redirects if not logged in" do
    get "/chambers"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
  context "polling" do 
    before(:each) do
      @candidate = create(:candidate)
    end
    describe "for signed in royal non-laurel" do
      before(:each) do
        royal = create(:royal)
        sign_in(royal)
      end
      describe "for current poll" do
        before(:each) do
          @current_poll = build(:poll, start_date: DateTime.now - 1.days, end_date: DateTime.now + 1.days)
          @current_poll.save(:validate => false)
          get "/chambers"
        end
        it "does not show take poll link for active poll" do
          expect(response.body).not_to include('Take Poll')  
        end
      end
    end
    context "for signed in non-admin laurel" do
      before(:each) do
        @laurel = create(:laurel_peer)
        sign_in(@laurel.user)
      end
      describe "for current poll" do
        before(:each) do
          @current_poll = build(:poll, start_date: DateTime.now - 1.days, end_date: DateTime.now + 1.days)
          @current_poll.save(:validate => false)
        end
        it "shows take poll link for active poll" do
          get "/chambers"
          expect(response.body).to include('Take Poll')  
        end
        it "shows end date of active poll" do
          get "/chambers"
          expect(response.body).to include(@current_poll.end_date.strftime('%d-%b-%Y'))  
        end
        it "shows if user has completed the poll" do
          @advising = create(:advising, candidate: @candidate, peer: @laurel, poll: @current_poll)
          get "/chambers"
          expect(response.body).to include('Finished')  
          expect(response.body).to include('Edit Poll')  
        end
        it "shows if user has not completed the poll" do
          get "/chambers"
          expect(response.body).not_to include('Finished')  
          expect(response.body).to include('Take Poll')  
        end
        it "shows if user has not completed the poll" do
          get "/chambers"
          expect(response.body).to include('0/1 Submitted')  
        end
        
      end
      describe "for past poll" do
        before(:each) do
          @past_poll = build(:poll, start_date: DateTime.now - 2.days, end_date: DateTime.now - 1.days)
          @past_poll.save(:validate => false)
          get "/chambers"
        end
        it "does not show take poll link for active poll" do
          expect(response.body).not_to include('Take Poll')  
        end
      end
      describe "for future poll" do
        before(:each) do
          create(:poll, start_date: DateTime.now + 3.days, end_date: DateTime.now + 4.days)
          get "/chambers"
        end
        it "does not show take poll link for active poll" do
          expect(response.body).not_to include('Take Poll')  
        end
      end
    end
    describe "for non-royal pelican user" do
      it "does not show pelican candidate specialties" do
        pelican = create(:pelican_user)
        sign_in(pelican)
        get "/chambers"
        expect(response.body).not_to include('<a class="list-group-item list-group-item-action" href="/chambers/pelican/specialties">Browse Candidates By Specialty</a>')  
      end
    end
    describe "for admin user" do
      before(:each) do
        admin = create(:admin)
        sign_in(admin)
      end
      describe "active poll" do
        before(:each) do
          current_poll = create(:current_poll)
          get "/chambers"
        end
        it "shows poll dates" do
          expect(response.body).to include('12:01 AM')
          expect(response.body).to include('11:59 PM')
        end
      end
      describe "scheduled poll" do
        before(:each) do
          poll = create(:future_poll)
          get "/chambers"
        end
        it "shows poll dates" do
          expect(response.body).to include('12:01 AM')
          expect(response.body).to include('11:59 PM')
        end
      end
    end
  end
end
