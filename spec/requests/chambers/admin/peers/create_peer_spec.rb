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
    it "sets defaults for new laurel" do
      post "/chambers/laurel/admin/peers", params: @params
      expect(Peer.last.sca_name).to eq("Dingus McDOOOGLE") 
      expect(Peer.last.active).to be_truthy 
      expect(Peer.last.vigilant).to be_truthy 
      expect(User.last.royalty).to be_falsy
    end
    it "handles true for vigilant for new laurel" do
      post "/chambers/laurel/admin/peers", params: { :laurel => {id: "", sca_name: "Dingus McDOOOGLE", vigilant: true, email: "dingus@doogleson.com"} }
      expect(Peer.last.vigilant).to be_truthy 
      
    end
    it "handles false for vigilant for new laurel" do
      post "/chambers/laurel/admin/peers", params: { :laurel => {id: "", sca_name: "Dingus McDOOOGLE", vigilant: false, email: "dingus@doogleson.com"} }
      expect(Peer.last.sca_name).to eq("Dingus McDOOOGLE") 
      expect(Peer.last.vigilant).to be_falsey 
    end
    it "shows generates slug for new laurel" do
      post "/chambers/laurel/admin/peers", params: { :laurel => {id: "", sca_name: "Heregyð Ketilsdóttir", email: "dingus@doogleson.com"} }
      expect(User.last.slug).to eq("heregyd_ketilsdottir")
    end
    it "sends welcome and change password email to new laurel" do
      post "/chambers/laurel/admin/peers", params: { :laurel => {id: "", sca_name: "Dingus McDOOOGLE", email: "dingus@doogleson.com"} }
      email = ActionMailer::Base.deliveries.last
      expect(email.to[0]).to eq("dingus@doogleson.com")
      expect(email.body).to include("Welcome to the Order of the Laurel")
    end
  end
  it "doesn't allow non admins to create new users" do
    non_admin = create("laurel".to_sym)
    sign_in(non_admin)    
    expect{post "/chambers/laurel/admin/peers", params: { :laurel => {sca_name: "Dingus McDOOOGLE", email: "dingus@doogleson.com"} } }.to raise_error(CanCan::AccessDenied)
  end
end
