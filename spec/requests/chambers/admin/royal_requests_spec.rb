require 'rails_helper'
#create royal
describe "post /chambers/admin/royalty" do
  context "for logged in laurel admin" do
    before(:each) do
      admin = create("laurel_admin".to_sym)
      sign_in(admin)
    end
    it "creates new royal" do
      expect(User.count).to eq(1)
      post '/chambers/admin/royalty', params: { :royal => {sca_name: 'Dingus McDOOOGLE', email: 'dingus@doogleson.com'} }
      expect(User.count).to eq(2)
    end
    it "sets defaults for new royal" do
      post '/chambers/admin/royalty', params: { :royal => {sca_name: 'Dingus McDOOOGLE', email: 'dingus@doogleson.com'} }
      expect(User.last.royalty).to be_truthy
    end
    it "shows generates slug for new royal" do
      post '/chambers/admin/royalty', params: { :royal => {sca_name: 'Heregyð Ketilsdóttir', email: 'dingus@doogleson.com'} }
      expect(User.last.slug).to eq('heregyd_ketilsdottir')
    end
    it "sends change password email to new royal" do
      post '/chambers/admin/royalty', params: { :royal => {sca_name: 'Dingus McDOOOGLE', email: 'dingus@doogleson.com'} }
      email = ActionMailer::Base.deliveries.last
      expect(email.to[0]).to eq('dingus@doogleson.com')
      expect(email.body).to include('Welcome to the Middle Kingdom Peerage Website')
    end
  end
end

#edit royal
describe "get /chambers/admin/royalty/:id/edit for laurel" do
  it "shows edit page for royal" do
    admin = create("laurel_admin".to_sym)
    sign_in(admin)
    royal = create(:royal, sca_name: "Dingus McDOOOGLE")
    get "/chambers/admin/royalty/#{royal.id}/edit"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Edit Royalty Status of Dingus McDOOOGLE')
  end
  it "redirects if not logged in" do
    royal = create(:royal)
    get "/chambers/admin/royalty/#{royal.id}/edit"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end

#index royal
describe "get /chambers/admin/royalty for laurel" do
  context "for logged in laurel admin" do
    before(:each) do
      @admin = create("laurel_admin".to_sym)
      sign_in(@admin)
    end
    it "shows list of candidates if laurel admin" do
      get "/chambers/admin/royalty"
      expect(response).to have_http_status(:success)
      expect(response.body).to include('Manage Royalty')
    end
    it "shows royalty bolded" do
      @admin.update(sca_name: 'Default Peer')
      royal = create(:royal, sca_name: 'Duke Ducky')
      get "/chambers/admin/royalty"
      expect(response.body).not_to include('<strong>Default Peer</strong>')
      expect(response.body).to include('<strong>Duke Ducky</strong>')
    end 
    it "does not show deceased users" do
      @admin.update(sca_name: 'Peter Peer')
      royalty = create(:royal, deceased: false, sca_name: 'Duke Ducky')
      dead_peer = create(:laurel_user, sca_name: 'Dead Peer', deceased: true)
      get "/chambers/admin/royalty"
      expect(response.body).to include('Peter Peer')
      expect(response.body).to include('Duke Ducky')
      expect(response.body).not_to include('Dead Peer')
    end 
    it "does not show deceased royals" do
      royalty = create(:royal, sca_name: 'Dead Royal', deceased: true)
      get "/chambers/admin/royalty"
      expect(response.body).not_to include('Dead Royal')
    end
  end
  it "redirects if not logged in" do
    get "/chambers/admin/royalty"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
  it "rasies AccessDenied Error if user is not an admin" do
    peer = create(:laurel_user)
    sign_in(peer)
    expect{get "/chambers/admin/royalty"}.to raise_error(CanCan::AccessDenied)
  end
end

#new royal
describe "get /chambers/admin/royalty/new for laurel" do
  it "shows form for new user if admin user" do
    admin = create("laurel_admin".to_sym)
    sign_in(admin)
    get "/chambers/admin/royalty/new"
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Add New Royal')
  end
  it "redirects if not logged in" do
    get "/chambers/admin/royalty/new"
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
  it "rasies AccessDenied Error if user is not an admin" do
    peer = create(:laurel_user)
    sign_in(peer)
    expect{get "/chambers/admin/royalty/new"}.to raise_error(CanCan::AccessDenied)
  end
end

#update royal
describe "put /chambers/admin/royalty/:id for laurel" do
  it "edits royalty status for given user, redirects to royalty manage page" do
    admin = create("laurel_admin".to_sym)
    royal = create(:royal, sca_name: 'New Royal', royalty: false)
    sign_in(admin)

    expect(User.last.sca_name).to eq('New Royal')
    expect(User.last.royalty).to be_falsy
    put "/chambers/admin/royalty/#{royal.id}", params: { :royal => {royalty: true} }
    expect(response).to redirect_to '/chambers/admin/royalty'
    expect(User.last.royalty).to be_truthy
  end
  it "redirects if not logged in" do
    royal = create(:royal)
    put "/chambers/admin/royalty/#{royal.id}", params: { :royal => {royalty: false} }
    expect(response).to have_http_status(:found)
    expect(response.body).to include('redirected')
  end
end
