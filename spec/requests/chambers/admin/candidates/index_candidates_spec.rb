require 'rails_helper'
describe "Get /chambers/laurel/admin/candidates" do
  context "for logged in laurel admin" do
    before(:each) do
      admin = create(:laurel_admin)
      sign_in(admin)
    end
    it "shows list of candidates if admin user" do
      get "/chambers/laurel/admin/candidates"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Manage Candidates')
    end
  end 
  it "redirects if not logged in" do
    get "/chambers/laurel/admin/candidates"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
  it "rasies AccessDenied Error if user is not an admin" do
    peer = create(:laurel_user)
    sign_in(peer)
    expect{get "/chambers/laurel/admin/candidates"}.to raise_error(CanCan::AccessDenied)
  end
end
