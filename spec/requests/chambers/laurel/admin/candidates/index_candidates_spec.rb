require "rails_helper"
describe "Get /chambers/laurel/admin/candidates" do
  context "for logged in laurel admin" do
    before(:each) do
      admin = create(:admin)
      sign_in(admin)
    end
    it "shows list of candidates if admin user" do
      get "/chambers/laurel/admin/candidates"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Manage Candidates')
    end
    it "only shows laurel candidates" do
      create(:candidate, peerage_type: :laurel, sca_name: 'Lucy Laurel')
      create(:candidate, peerage_type: :pelican, sca_name: 'Peter Pelican')
      get "/chambers/laurel/admin/candidates"
      expect(response.body).to include('Lucy Laurel')
      expect(response.body).not_to include('Peter Pelican')
      
    end
  end
  context "for logged in pelican admin" do
    before(:each) do
      pelican_admin = create(:pelican_admin)
      sign_in(pelican_admin)
    end
    it "rasies AccessDenied Error" do
      expect{get "/chambers/laurel/admin/candidates"}.to raise_error(CanCan::AccessDenied)
    end
  end
  context "for logged in non-admin laurel" do
    before(:each) do
      laurel = create(:user)
      sign_in(laurel)
    end
    it "rasies AccessDenied Error" do
      expect{get "/chambers/laurel/admin/candidates"}.to raise_error(CanCan::AccessDenied)
    end
  end
  it "redirects if not logged in" do
    get "/chambers/laurel/admin/candidates"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
