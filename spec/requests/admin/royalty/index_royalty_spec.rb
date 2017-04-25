require "rails_helper"
describe "Get /chambers/admin/royalty" do
  it "shows list of candidates if admin user" do
    laurel = create(:user, role: :admin)
    sign_in(laurel)
    get "/chambers/admin/royalty"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Manage Royalty')
  end
  it "shows royalty bolded" do
    laurel = create(:user, sca_name: 'Default Laurel', role: :admin)
    royalty = create(:user, sca_name: 'Duke Ducky', royalty: true, laurel: false)
    sign_in(laurel)
    get "/chambers/admin/royalty"
    expect(response.body).not_to include('<strong>Default Laurel</strong>')
    expect(response.body).to include('Duke Ducky')
  end 
  it "shows does not show inactive users" do
    laurel = create(:user, sca_name: 'Default Laurel', role: :admin)
    royalty = create(:user, sca_name: 'Duke Ducky', royalty: true, laurel: false)
    laurel2 = create(:user, sca_name: 'Inactive Laurel', active: false)
    sign_in(laurel)
    get "/chambers/admin/royalty"
    expect(response.body).not_to include('Inactive Laurel')
  end 
  it "redirects if not logged in" do
    get "/chambers/admin/royalty"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
  it "rasies AccessDenied Error if user is not an admin" do
    laurel = create(:user, role: :normal)
    sign_in(laurel)
    expect{get "/chambers/admin/royalty"}.to raise_error(CanCan::AccessDenied)
  end
end
