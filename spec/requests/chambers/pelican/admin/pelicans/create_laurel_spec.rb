require "rails_helper"
describe "post /chambers/laurel/admin/laurels" do
  before(:each) do
    admin = create(:admin)
    sign_in(admin)
  end
  it "creates new laurel" do
    expect(User.count).to eq(1)
    expect(Peer.count).to eq(1)
    post '/chambers/laurel/admin/laurels', params: { :laurel => {sca_name: 'Dingus McDOOOGLE', email: 'dingus@doogleson.com'} }
    expect(User.count).to eq(2)
    expect(Peer.count).to eq(2)
  end
  it "sets defaults for new laurel" do
    post '/chambers/laurel/admin/laurels', params: { :laurel => {sca_name: 'Dingus McDOOOGLE', email: 'dingus@doogleson.com'} }
    expect(Laurel.last.sca_name).to eq('Dingus McDOOOGLE') 
    expect(Laurel.last.active).to be_truthy 
    expect(Laurel.last.vigilant).to be_truthy 
    expect(User.last.royalty).to be_falsy
  end
  it "handles false for vigilant for new laurel" do
    post '/chambers/laurel/admin/laurels', params: { :laurel => {sca_name: 'Dingus McDOOOGLE', vigilant: false, email: 'dingus@doogleson.com'} }
    expect(Laurel.last.sca_name).to eq('Dingus McDOOOGLE') 
    expect(Laurel.last.vigilant).to be_falsey 
  end
  it "shows generates slug for new laurel" do
    post '/chambers/laurel/admin/laurels', params: { :laurel => {sca_name: 'Heregyð Ketilsdóttir', email: 'dingus@doogleson.com'} }
    expect(User.last.slug).to eq('heregyd_ketilsdottir')
  end
  it "sends change password email to new laurel" do
    post '/chambers/laurel/admin/laurels', params: { :laurel => {sca_name: 'Dingus McDOOOGLE', email: 'dingus@doogleson.com'} }
    email = ActionMailer::Base.deliveries.last
    expect(email.to[0]).to eq('dingus@doogleson.com')
    expect(email.body).to include('Welcome to the Order of the Laurel')
  end
  context 'for existing pelican,' do
    before(:each) do
      @pelican = create(:pelican, sca_name: 'Peter Pelican', email: 'peter_pelican@example.com')
    end
    it "adds laurel peerage to existing pelican" do
      expect(@pelican.peers.count).to eq(1)
      post '/chambers/laurel/admin/laurels', params: { :laurel => {sca_name: 'Peter Pelican', email: 'peter_pelican@example.com'} }
      expect(@pelican.peers.count).to eq(2)
    end  

    it "keeps exisitng peer's password when adding new peerage" do 
      old_encrypted_password = User.last.encrypted_password
      post '/chambers/laurel/admin/laurels', params: { :laurel => {sca_name: 'Peter Pelican', email: 'peter_pelican@example.com'} }
      expect(User.last.encrypted_password).to eq(old_encrypted_password)
    end
    it "sends welcome note to new pelican/laurel" do
      post '/chambers/laurel/admin/laurels', params: { :laurel => {sca_name: 'Peter Pelican', email: 'peter_pelican@example.com'} }
      email = ActionMailer::Base.deliveries.last
      expect(email.to[0]).to eq('peter_pelican@example.com')
      expect(email.body).to include('have access to Laurelate content.')
    end
  end
  it "doesn't allow non admins to create new users" do
    non_admin = create(:user)
    sign_in(non_admin)    
    expect{post '/chambers/laurel/admin/laurels', params: { :laurel => {sca_name: 'Dingus McDOOOGLE', email: 'dingus@doogleson.com'} } }.to raise_error(CanCan::AccessDenied)
  end
end
