require 'rails_helper'
#edit_peers
describe "get /chambers/laurel/admin/peers/:id/edit" do
  context "for logged in laurel admin" do
    before(:each) do
      admin = create(:laurel_admin)
      sign_in(admin)
    end
    it "shows edit page for laurel" do
      new_user = create(:laurel_user, sca_name: 'Dingus McDOOOGLE')
      get "/chambers/laurel/admin/peers/#{new_user.peers.first.id}/edit"
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Edit #{:laurel.capitalize} Dingus McDOOOGLE")
    end
  end
  it "redirects if not admin userlogged in" do
    user = create(:laurel_user, sca_name: 'Dingus McDOOOGLE')
    get "/chambers/laurel/admin/peers/#{user.peers.first.id}/edit"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end

#index_peers
describe "get /chambers/laurel/admin/peers" do
  context "for laurel admin" do
    before(:each) do
      admin = create("laurel_admin".to_sym, sca_name: 'Peter Peer')
      sign_in(admin)
    end
    it "shows list of laurels if admin user" do
      get "/chambers/laurel/admin/peers"
      expect(response).to have_http_status(:success)
      expect(response.body).to include("Manage Laurels")
    end
    it "does not show royals" do
      royalty = create(:royal, sca_name: 'Duke Ducky')
      get "/chambers/laurel/admin/peers"
      expect(response.body).to include('Peter Peer')
      expect(response.body).not_to include('Duke Ducky')
    end
  end
  it "redirects if not logged in" do
    get "/chambers/laurel/admin/peers"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
  it "rasies AccessDenied Error if user is not an admin" do
    peer = create(:laurel_user)
    sign_in(peer)
    expect{get "/chambers/laurel/admin/peers"}.to raise_error(CanCan::AccessDenied)
  end
end

#new_peers
describe "Get /chambers/laurel/admin/peers/new" do
  it "shows form for new user if laurel admin user" do
    admin = create(:laurel_admin)
    sign_in(admin)
    get "/chambers/laurel/admin/peers/new"
    expect(response).to have_http_status(:success)
    expect(response.body).to include("Add New Laurel")
  end
  it "redirects if not logged in" do
    get "/chambers/laurel/admin/peers/new"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
  it "rasies AccessDenied Error if user is not an admin" do
    peer = create(:laurel_user)
    sign_in(peer)
    expect{get "/chambers/laurel/admin/peers/new"}.to raise_error(CanCan::AccessDenied)
  end
end

#update_peers
describe "put /chambers/laurel/admin/peers/:id" do
  context "for signed in laurel admin" do
    before(:each) do
      admin = create("laurel_admin".to_sym)
      sign_in(admin)
    end
    it "update profile for signed in laurel admin, and redirects to profile page" do
      newly_deceased = create(:laurel_user, sca_name: "Newly Deceased", deceased: false)

      expect(User.last.sca_name).to eq("Newly Deceased")
      expect(Peer.last.active).to be_truthy
      expect(User.last.deceased).to be_falsy
      put "/chambers/laurel/admin/peers/#{newly_deceased.peers.first.id}", params: { :laurel => {deceased: true} }
      expect(response).to redirect_to "/chambers/laurel/admin/peers"
      expect(Peer.last.active).to be_falsy
      expect(User.last.deceased).to be_truthy
    end
  end
  it "redirects if not logged in" do
    newly_deceased = create(:laurel_user, sca_name: "Newly Deceased", deceased: false)
    put "/chambers/laurel/admin/peers/#{newly_deceased.id}", params: { :laurel => {deceased: true} }
    expect(response).to have_http_status(:found)
    expect(response.body).to include("redirected")
  end
end
