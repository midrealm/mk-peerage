require "rails_helper"
describe "Get /chambers/laurel/admin/candidates/new" do
  context "for logged in admin" do
    before(:each) do
      admin = create(:admin)
      sign_in(admin)
    end
    it "shows form for new user if admin user" do
      get "/chambers/laurel/admin/candidates/new"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Add New Candidate')
    end
    it "shows only specialties laurel appropriate specialties" do
      laurel_specialty = create(:specialty, name: 'Nitpicking', peerage_type: :laurel)
      pelican_specialty = create(:specialty, name: 'Complaining', peerage_type: :pelican)
      get "/chambers/laurel/admin/candidates/new"
      expect(response.body).to include('Nitpicking')
      expect(response.body).not_to include('Complaining')
    end
  end
  it "redirects if not logged in" do
    get "/chambers/laurel/admin/candidates/new"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
  it "rasies AccessDenied Error if user is not an admin" do
    laurel = create(:user)
    sign_in(laurel)
    expect{get "/chambers/laurel/admin/candidates/new"}.to raise_error(CanCan::AccessDenied)
  end
end
