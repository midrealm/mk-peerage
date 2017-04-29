require "rails_helper"
describe "put /chambers/admin/poll" do
  it "edits profile for signed in laurel, and redirects to profile page" do
    laurel = create(:user, role: 'admin')
    sign_in(laurel)
    start_date = (DateTime.now + 1.day).strftime('%d-%b-%Y')
    end_date = (DateTime.now + 2.days).strftime('%d-%b-%Y')
    put "/chambers/admin/poll", params: { :poll => {start_date: start_date, end_date: end_date} }
    expect(response).to redirect_to "/chambers"
  end
  it "redirects if not logged in" do
    put "/chambers/admin/poll", params: { :poll => {start_date: '', end_date:''} }
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
