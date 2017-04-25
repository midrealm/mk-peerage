require "rails_helper"
describe "Get /chambers/admin/laurels" do
  it "shows list of candidates if admin user" do
    laurel = create(:user, role: :admin)
    sign_in(laurel)
    get "/chambers/admin/laurels"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Manage Laurels')
  end
  it "shows only laurels" do
    laurel = create(:user, sca_name: 'Default Laurel', role: :admin)
    royalty = create(:user, sca_name: 'Duke Ducky', royalty: true, laurel: false)
    sign_in(laurel)
    get "/chambers/admin/laurels"
    expect(response.body).to include('Default Laurel')
    expect(response.body).not_to include('Duke Ducky')

  end
  it "redirects if not logged in" do
    get "/chambers/admin/laurels"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
  it "rasies AccessDenied Error if user is not an admin" do
    laurel = create(:user, role: :normal)
    sign_in(laurel)
    expect{get "/chambers/admin/laurels"}.to raise_error(CanCan::AccessDenied)
  end
end
