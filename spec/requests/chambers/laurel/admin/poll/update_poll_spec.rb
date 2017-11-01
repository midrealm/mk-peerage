require "rails_helper"
describe "put /chambers/admin/poll" do
  it "updates poll, and redirects to profile page" do
    admin = create(:admin)
    sign_in(admin)
    poll = create(:poll)
    start_date = (DateTime.now + 3.days).strftime('%d-%b-%Y')
    end_date = (DateTime.now + 4.days).strftime('%d-%b-%Y')
    put "/chambers/admin/poll", params: { :poll => {start_date: start_date, end_date: end_date} }
    expect(response).to redirect_to "/chambers"
  end
  it "updates poll for current poll" do
    admin = create(:admin)
    sign_in(admin)
    poll = build(:poll, start_date: DateTime.now - 1.day, end_date: DateTime.now + 1.day)
    poll.save(:validate => false)
    end_date = (DateTime.now + 4.days).strftime('%d-%b-%Y')
    put "/chambers/admin/poll", params: { :poll => { end_date: end_date} }
    expect(response).to redirect_to "/chambers"
  end

  it "redirects if not logged in" do
    poll = create(:poll)
    put "/chambers/admin/poll", params: { :poll => {start_date: '', end_date:''} }
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
