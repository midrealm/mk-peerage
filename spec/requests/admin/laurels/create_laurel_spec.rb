require "rails_helper"
describe "post /chambers/admin/laurels" do
  before(:each) do
    admin = create(:admin)
    sign_in(admin)
  end
  it "creates new laurel" do
    expect(User.count).to eq(1)
    expect(Peer.count).to eq(1)
    post '/chambers/admin/laurels', params: { :laurel => {sca_name: 'Dingus McDOOOGLE', email: 'dingus@doogleson.com'} }
    expect(User.count).to eq(2)
    expect(Peer.count).to eq(2)
  end
  it "sets defaults for new laurel" do
    post '/chambers/admin/laurels', params: { :laurel => {sca_name: 'Dingus McDOOOGLE', email: 'dingus@doogleson.com'} }
    expect(User.last.active).to be_truthy 
    expect(User.last.vigilant).to be_truthy 
    expect(User.last.royalty).to be_falsy
  end
  it "handles false for vigilant for new laurel" do
    post '/chambers/admin/laurels', params: { :laurel => {sca_name: 'Dingus McDOOOGLE', vigilant: false, email: 'dingus@doogleson.com'} }
    expect(User.last.vigilant).to be_falsey 
  end
  it "shows generates slug for new laurel" do
    post '/chambers/admin/laurels', params: { :laurel => {sca_name: 'Heregyð Ketilsdóttir', email: 'dingus@doogleson.com'} }
    expect(User.last.slug).to eq('heregyd_ketilsdottir')
  end
  it "sends change password email to new laurel" do
    post '/chambers/admin/laurels', params: { :laurel => {sca_name: 'Dingus McDOOOGLE', email: 'dingus@doogleson.com'} }
    email = ActionMailer::Base.deliveries.last
    expect(email.to[0]).to eq('dingus@doogleson.com')
    expect(email.body).to include('Welcome to the Order of the Laurel')
  end
  it "doesn't allow non admins to create new users" do
    non_admin = create(:user)
    sign_in(non_admin)    
    expect{post '/chambers/admin/laurels', params: { :laurel => {sca_name: 'Dingus McDOOOGLE', email: 'dingus@doogleson.com'} } }.to raise_error(CanCan::AccessDenied)
  end
end
