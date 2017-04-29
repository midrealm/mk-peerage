require "rails_helper"
describe "Get /chambers" do
  it "shows dashboard for logged in user" do
    laurel = create(:user)
    sign_in(laurel)
    get "/chambers"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Edit Your Profile')
  end
  it "shows Admin Tasks for admin user" do
    admin = create(:user, role: :admin)
    sign_in(admin)
    get "/chambers"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Admin Tasks')
  end
  it "does not show Admin Tasks for normal user" do
    laurel = create(:user, role: :normal)
    sign_in(laurel)
    get "/chambers"
    expect(response).to have_http_status(:success)
    expect(response.body).not_to include('Admin Tasks')
  end
  it "redirects if not logged in" do
    get "/chambers"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
  describe "polling" do 
    it "shows create poll link for admin if no active or scheduled poll" do
      admin = create(:user, role: :admin)
      sign_in(admin)
      past_poll = build(:poll, start_date: DateTime.now - 2.days, end_date: DateTime.now - 1.days)
      past_poll.save(:validate => false)
      get "/chambers"
      expect(response.body).to include('Create New Poll')
    end
    describe "active poll" do
      before(:each) do
        admin = create(:user, role: :admin)
        sign_in(admin)
        current_poll = build(:poll, start_date: DateTime.now - 1.days, end_date: DateTime.now + 1.days)
        current_poll.save(:validate => false)
        get "/chambers"
      end
      it "does not show polling link for admin if there is an active poll" do
        expect(response.body).not_to include('Create New Poll')
      end
      it "shows edit poll link for admin if there is an active poll" do
        expect(response.body).to include('Edit Poll')
      end
      it "shows poll dates" do
        expect(response.body).to include('12:01 AM')
        expect(response.body).to include('11:59 PM')
      end
    end
    describe "scheduled poll" do
      before(:each) do
        admin = create(:user, role: :admin)
        sign_in(admin)
        poll = create(:poll, start_date: DateTime.now + 1.days, end_date: DateTime.now + 2.days)
        get "/chambers"
      end
      it "does not show polling link for admin if there is a scheduled poll" do
        expect(response.body).not_to include('Create New Poll')
      end
      it "shows edit poll link for admin if there is a scheduled poll" do
        expect(response.body).to include('Edit Poll')
      end
      it "shows poll dates" do
        expect(response.body).to include('12:01 AM')
        expect(response.body).to include('11:59 PM')
      end
    end
  end
end
