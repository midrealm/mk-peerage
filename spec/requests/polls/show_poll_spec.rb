require 'rails_helper'
describe "Get /chambers/poll" do
  describe "logged in laurel" do
    before(:each) do
      laurel = create(:user, laurel: true)
      sign_in(laurel)
    end
    describe "current poll" do
      before(:each) do
        poll = build(:poll, start_date: DateTime.now - 1.day, end_date: DateTime.now + 1.day)
        poll.save(validate: false)
      end
      it "shows poll" do
        get '/chambers/poll'
        expect(response).to have_http_status(:success)
        expect(response.body).to include('Poll')
      end
      it "shows list of candidates" do
        create(:candidate, sca_name: "Candidate1")
        create(:candidate, sca_name: "Candidate2")
        get '/chambers/poll'
        expect(response.body).to include('Candidate1')
        expect(response.body).to include('Candidate2')
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
      royal = create(:user, laurel: false, royalty: true)
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
