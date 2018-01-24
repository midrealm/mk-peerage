require 'rails_helper'
describe "post /chambers/laurel/admin/peers" do
  context "for signed in admin laurel" do
    before(:each) do
      admin = create("laurel_admin".to_sym)
      sign_in(admin)
      @params = { :laurel => {id: "", sca_name: "Dingus McDOOOGLE", email: "dingus@doogleson.com"} }
    end
    it "creates new laurel" do
      expect(User.count).to eq(1)
      expect(Peer.count).to eq(1)
      post "/chambers/laurel/admin/peers", params: @params
      expect(User.count).to eq(2)
      expect(Peer.count).to eq(2)
    end
    it "sends welcome and change password email to new laurel" do
      post "/chambers/laurel/admin/peers", params: { :laurel => {id: "", sca_name: "Dingus McDOOOGLE", email: "dingus@doogleson.com"} }
      email = ActionMailer::Base.deliveries.last
      expect(email.to[0]).to eq("dingus@doogleson.com")
      expect(email.body).to include("Welcome to the Order of the Laurel")
    end
    it 'handles bad user input' do
      post "/chambers/laurel/admin/peers", params: { :laurel => {id: "", sca_name: "", email: "", vigilant:false} }
      expect(response.body).to include('Email is invalid')
      expect(response.body).to include("<input id=\"laurel_vigilant_false\" type=\"radio\" value=\"true\" checked=\"checked\"")
    end
  end
  it "doesn't allow non admins to create new users" do
    non_admin = create("laurel".to_sym)
    sign_in(non_admin)    
    expect{post "/chambers/laurel/admin/peers", params: { :laurel => {sca_name: "Dingus McDOOOGLE", email: "dingus@doogleson.com"} } }.to raise_error(CanCan::AccessDenied)
  end
end
