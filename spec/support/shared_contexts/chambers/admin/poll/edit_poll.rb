shared_examples_for "get /chambers/PEERAGE/admin/poll/edit" do |peerage, other_peerage|
  describe "Get /chambers/#{peerage}/admin/poll/edit" do
    describe "for logged in admin" do 
      before(:each) do
        admin = create("#{peerage}_admin".to_sym)
        sign_in(admin)
        @future_poll = build(:future_poll, peerage_type: peerage)
        @current_poll = build(:current_poll, peerage_type: peerage)
        @past_poll = build(:past_poll, peerage_type: peerage)
      end
      it "shows edit page for future poll" do
        @future_poll.save
        get "/chambers/#{peerage}/admin/poll/edit"
        expect(response).to have_http_status(:success)
        expect(response.body).to include("Edit #{peerage.capitalize} Poll")
      end
      it "shows fields for start_date and end_date for future poll" do
        @future_poll.save
        get "/chambers/#{peerage}/admin/poll/edit"
        expect(response).to have_http_status(:success)
        expect(response.body).to include("Start date")
        expect(response.body).to include("End date")
      end
      it "shows edit page for current poll" do
        @current_poll.save(:validate => false)
        get "/chambers/#{peerage}/admin/poll/edit"
        expect(response).to have_http_status(:success)
        expect(response.body).to include("Edit #{peerage.capitalize} Poll")
      end
      it "does not show start_date for current poll" do
        @current_poll.save(:validate => false)
        get "/chambers/#{peerage}/admin/poll/edit"
        expect(response).to have_http_status(:success)
        expect(response.body).not_to include("Start date")
        expect(response.body).to include("End date")
      end
      it "does not show edit page for past poll" do
        @past_poll.save(:validate => false)
        get "/chambers/#{peerage}/admin/poll/edit"
        expect(response).to have_http_status(:found)
        expect(response.body).to include("redirected")
      end
    end
    it "redirects if not logged in" do
      get "/chambers/#{peerage}/admin/poll/edit"
      expect(response).to have_http_status(:found)
      expect(response.body).to include("redirected")
    end
  end
end
