require "rails_helper"
describe "Get /chambers/admin/royalty" do
  it "shows list of candidates if admin user" do
    admin = create(:admin)
    sign_in(admin)
    get "/chambers/admin/royalty"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Manage Royalty')
  end
  it "shows royalty bolded" do
    admin = create(:admin)
    royal = create(:royal, sca_name: 'Duke Ducky')
    sign_in(admin)
    get "/chambers/admin/royalty"
    expect(response.body).not_to include('<strong>Default Laurel</strong>')
    expect(response.body).to include('<strong>Duke Ducky</strong>')
  end 
  it "does not show deceased users" do
    admin = create(:admin, deceased: nil, sca_name: 'Mundungus')
    royalty = create(:royal, deceased: false, sca_name: 'Duke Ducky')
    dead_laurel = create(:user, sca_name: 'Dead Laurel', deceased: true)
    sign_in(admin)
    get "/chambers/admin/royalty"
    expect(response.body).to include('Mundungus')
    expect(response.body).to include('Duke Ducky')
    expect(response.body).not_to include('Dead Laurel')
  end 
  it "does not show deceased royals" do
    royalty = create(:royal, sca_name: 'Dead Royal', deceased: true)
    admin = create(:admin)
    sign_in(admin)
    get "/chambers/admin/royalty"
    expect(response.body).not_to include('Dead Royal')
  end
  it "redirects if not logged in" do
    get "/chambers/admin/royalty"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
  it "rasies AccessDenied Error if user is not an admin" do
    peer = create(:user)
    sign_in(peer)
    expect{get "/chambers/admin/royalty"}.to raise_error(CanCan::AccessDenied)
  end
end
