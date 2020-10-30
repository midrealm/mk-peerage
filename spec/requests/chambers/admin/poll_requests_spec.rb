require 'rails_helper'
#index polls
describe "get /chambers/:peerages/admin/polls" do
  context "logged in authorized admin" do
    before(:each) do
      admin = create(:laurel_admin)
      sign_in(admin)
    end
    it "shows management page" do
      get "/chambers/laurel/admin/polls" do
        expect(response).to have_http_status(:success)
        expect(response.body).to include('Manage Laurel Polls')
      end
    end
  end
end
#create poll
describe "post /chambers/laurel/admin/poll" do
  before(:each) do
    admin = create("laurel_admin".to_sym)
    sign_in(admin)
    @start_date = '01-Jan-3000' 
    @end_date = '03-Jan-3000'
    @params = { :poll => {start_date: @start_date, end_date: @end_date} }
  end
  it "creates new poll" do
    expect(Poll.count).to eq(0)
    post "/chambers/laurel/admin/poll", params: @params
    expect(Poll.count).to eq(1)
  end
  it "sets start_date time to midnight" do
    post "/chambers/laurel/admin/poll", params: @params
    expect(Poll.first.start_date.strftime("%H:%M:%S")).to eq("00:00:00")
  end
  it "sets end_date time to 23:59:59" do
    post "/chambers/laurel/admin/poll", params: @params
    expect(Poll.first.end_date.strftime("%H:%M:%S")).to eq("23:59:59")
  end
  it "accepts same date for start and end" do
    post "/chambers/laurel/admin/poll", params: @params
    expect(Poll.count).to eq(1)
    expect(Poll.first.start_date.strftime("%H:%M:%S")).to eq("00:00:00")
    expect(Poll.first.end_date.strftime("%H:%M:%S")).to eq("23:59:59")
  end
  it "rejects garbage string" do
    expect(Poll.count).to eq(0)
    post "/chambers/laurel/admin/poll", params: { :poll => {start_date: "aw;eofiajw", end_date: "awfe;oiawj"} }
    expect(Poll.count).to eq(0)
  end 
end

#edit poll
describe "Get /chambers/laurel/admin/poll/edit" do
  describe "for logged in admin" do 
    before(:each) do
      admin = create("laurel_admin".to_sym)
      sign_in(admin)
      @future_poll = build(:future_poll, peerage_type: :laurel)
      @current_poll = build(:current_poll, peerage_type: :laurel)
      @past_poll = build(:past_poll, peerage_type: :laurel)
    end
    it "shows edit page for future poll" do
      @future_poll.save
      get "/chambers/laurel/admin/poll/edit"
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Edit #{:laurel.capitalize} Poll")
    end
    it "shows fields for start_date and end_date for future poll" do
      @future_poll.save
      get "/chambers/laurel/admin/poll/edit"
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Start date")
      expect(response.body).to include("End date")
    end
    it "shows edit page for current poll" do
      @current_poll.save(:validate => false)
      get "/chambers/laurel/admin/poll/edit"
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Edit #{:laurel.capitalize} Poll")
    end
    it "does not show start_date for current poll" do
      @current_poll.save(:validate => false)
      get "/chambers/laurel/admin/poll/edit"
      expect(response).to have_http_status(:success)
      expect(response.body).not_to include("Start date")
      expect(response.body).to include("End date")
    end
    it "does not show edit page for past poll" do
      @past_poll.save(:validate => false)
      get "/chambers/laurel/admin/poll/edit"
      expect(response).to have_http_status(:found)
      expect(response.body).to include("redirected")
    end
  end
  it "redirects if not logged in" do
    get "/chambers/laurel/admin/poll/edit"
    expect(response).to have_http_status(:found)
    expect(response.body).to include("redirected")
  end
end

#new poll
describe "Get /chambers/laurel/admin/poll/new" do
  it "shows form for new user if admin user" do
    admin = create("laurel_admin".to_sym)
    sign_in(admin)
    get "/chambers/laurel/admin/poll/new"
    expect(response).to have_http_status(:success)
    expect(response.body).to include("Create New #{:laurel.capitalize} Poll")
  end
  it "redirects if not logged in" do
    get "/chambers/laurel/admin/poll/new"
    expect(response).to have_http_status(:found)
    expect(response.body).to include("redirected")
  end
  it "rasies AccessDenied Error if user is not an admin" do
    peer = create(:laurel_user)
    sign_in(peer)
    expect{get "/chambers/laurel/admin/poll/new"}.to raise_error(CanCan::AccessDenied)
  end
end

#update poll
describe "put /chambers/laurel/admin/poll" do
  it "updates poll, and redirects to poll management page" do
    admin = create("laurel_admin".to_sym)
    sign_in(admin)
    poll = create(:future_poll, peerage_type: :laurel)
    start_date = (DateTime.now + 3.days).strftime('%d-%b-%Y')
    end_date = (DateTime.now + 4.days).strftime('%d-%b-%Y')
    put "/chambers/laurel/admin/poll", params: { :poll => {start_date: start_date, end_date: end_date} }
    expect(response).to redirect_to "/chambers/laurel/admin/polls"
  end
  it "updates poll for current poll" do
    admin = create("laurel_admin".to_sym)
    sign_in(admin)
    poll = create(:current_poll, peerage_type: :laurel)
    end_date = (DateTime.now + 4.days).strftime('%d-%b-%Y')
    put "/chambers/laurel/admin/poll", params: { :poll => { end_date: end_date} }
    expect(response).to redirect_to "/chambers/laurel/admin/polls"
    expect(Poll.last.end_date.strftime('%d-%b-%Y')).to eq(end_date)
  end

  it "redirects if not logged in" do
    poll = create(:poll, peerage_type: :laurel)
    put "/chambers/laurel/admin/poll", params: { :poll => {start_date: '', end_date:''} }
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
#publish poll
describe "put /chambers/laurel/admin/polls/id/publish" do
  it "updates published status of past poll" do
    admin = create("laurel_admin".to_sym)
    sign_in(admin)
    poll = create(:past_poll, published: false)
    put "/chambers/laurel/admin/polls/#{poll.id}/publish"
    expect(Poll.find(poll.id).published?).to be_truthy
  end  
end
#calculate poll
describe "put /chambers/laurel/admin/polls/:id/calculate" do
	it "calculates poll results for finished poll" do
    admin = create("laurel_admin".to_sym)
    sign_in(admin)
    poll = create(:past_poll, published: false)
		candidate = create(:laurel_candidate)
    advising = create(:advising, candidate: candidate, peer: admin.laurel, poll: poll) 
		expect(PollResult.count).to eq(0)
    put "/chambers/laurel/admin/polls/#{poll.id}/calculate"
		expect(PollResult.count).to eq(1)
	end
end
#analytics
describe "get /chambers/laurel/admin/poll/analytics" do
	before(:each) do
		admin = create(:laurel_admin)
		sign_in(admin)
		@candidate = create(:laurel_candidate)
		@poll = create(:current_poll)
	end
	it "show poll analytics for active poll" do
		get "/chambers/laurel/admin/poll/analytics" 
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Active Laurel Poll Analytics')
	end
end

#offline
describe "get /chambers/laurel/admin/poll/offline" do
	before(:each) do
		admin = create(:laurel_admin)
		sign_in(admin)
		@vote_candidate = create(:laurel_candidate, sca_name: 'Violet Vote', vote: true)
		@watch_candidate = create(:laurel_candidate, sca_name: 'Wally Watch', vote: false)
		@poll = create(:current_poll)
	end
	it "show offline poll for printing for active poll" do
		get "/chambers/laurel/admin/poll/offline" 
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Laurel Poll')
	end
	it "shows vote and watch candidates " do
		get "/chambers/laurel/admin/poll/offline" 
    expect(response.body).to include('Wally Watch')
    expect(response.body).to include('Violet Vote')
	end
end
