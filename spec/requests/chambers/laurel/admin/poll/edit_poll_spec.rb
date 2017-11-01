require "rails_helper"
describe "Get /chambers/laurel/admin/poll/edit" do
  describe "for logged in admin" do 
    before(:each) do
      admin = create(:admin)
      sign_in(admin)
      @future_poll = build(:poll, start_date: DateTime.now + 1.days, end_date: DateTime.now + 2.days)
      @current_poll = build(:poll, start_date: DateTime.now - 1.days, end_date: DateTime.now + 2.days)
      @past_poll = build(:poll, start_date: DateTime.now - 2.days, end_date: DateTime.now - 1.days)
    end
    it "shows edit page for future poll" do
      @future_poll.save
      get "/chambers/laurel/admin/poll/edit"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Edit Poll')
    end
    it "shows fields for start_date and end_date for future poll" do
      @future_poll.save
      get "/chambers/laurel/admin/poll/edit"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Start date')
      expect(response.body).to include('End date')
    end
    it "shows edit page for current poll" do
      @current_poll.save(:validate => false)
      get "/chambers/laurel/admin/poll/edit"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Edit Poll')
    end
    it "does not show start_date for current poll" do
      @current_poll.save(:validate => false)
      get "/chambers/laurel/admin/poll/edit"
      expect(response).to have_http_status(:success)
      expect(response.body).not_to include('Start date')
      expect(response.body).to include('End date')
    end
    it "does not show edit page for past poll" do
      @past_poll.save(:validate => false)
      get "/chambers/laurel/admin/poll/edit"
      expect(response).to have_http_status(:found)
      expect(response.body).to include('redirected')
    end
  end
  it "redirects if not logged in" do
    get "/chambers/laurel/admin/poll/edit"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
