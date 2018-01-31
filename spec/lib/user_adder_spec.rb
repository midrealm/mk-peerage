require 'user_adder'
require 'rails_helper'

describe UserAdder, 'initialize' do
  it "assigns values properly" do
    adder = UserAdder.new(id: 31, sca_name: 'Default Name', email: 'email@email.com', vigilant: false, peerage: :laurel)
    expect(adder.id).to eq(31)
    expect(adder.sca_name).to eq('Default Name')
    expect(adder.email).to eq('email@email.com')
    expect(adder.vigilant).to be_falsey
    expect(adder.peerage).to eq(:laurel)
    expect(adder.user).to be_falsey
  end
  it "handles only peerage input" do
    adder = UserAdder.new(peerage: :laurel)
    expect(adder.id).to be_nil
    expect(adder.sca_name).to eq('')
    expect(adder.email).to eq('')
    expect(adder.vigilant).to be_truthy
    expect(adder.peerage).to eq(:laurel)
  end
  

  it "handles only only sca_name, email, and peerage" do
    adder = UserAdder.new(sca_name: 'Default Name', email: 'email@email.com', peerage: :laurel)
    expect(adder.id).to be_nil
    expect(adder.sca_name).to eq('Default Name')
    expect(adder.email).to eq('email@email.com')
    expect(adder.vigilant).to be_truthy
    expect(adder.peerage).to eq(:laurel)
  end

  it "throws error for no peerage" do
    expect{UserAdder.new(id: 31, sca_name: 'Default Name', email: 'email@email.com', vigilant: false)}.to raise_error(ArgumentError)
  end

end

describe UserAdder, 'add' do
  context 'for totally new user' do
    it "throws error for no id, sca_name, or email" do
      adder = UserAdder.new(peerage: :laurel)
      expect{adder.add}.to raise_error(ArgumentError)
    end
    it "throws error for no id, sca_name, but yes email" do
      adder = UserAdder.new(email: 'email@email.com',peerage: :laurel)
      expect{adder.add}.to raise_error(ArgumentError)
    end
    it "throws error for no id, email, but yes sca_name" do
      adder = UserAdder.new(sca_name: 'Default Name',peerage: :laurel)
      expect{adder.add}.to raise_error(ArgumentError)
    end
    it 'should return true; user property should be updated with given associated peer on successful save' do
      adder = UserAdder.new(id: nil, sca_name: 'Default User', email: 'example@example.com', vigilant: true, peerage: :laurel)
      result = adder.add
      user = adder.user
      expect(user.class.name).to eq('User') 
      expect(user).to eq(User.last)
      expect(user.laurel).to eq(Laurel.last)
    end
    it 'should set defaults for new laurel' do
      adder = UserAdder.new(id: nil, sca_name: 'Default User', email: 'example@example.com', vigilant: nil, peerage: :laurel)
      result = adder.add
      user = adder.user
      laurel = user.laurel
      expect(laurel.active).to be_truthy
      expect(laurel.vigilant).to be_truthy 
      expect(user.royalty).to be_falsy
      expect(user.deceased).to be_falsy
    end
  end  
  context 'for adding new peerage to existing user' do
    it "handles only id and peerage" do
      adder = UserAdder.new(id: 31, peerage: :laurel)
      adder.add
      expect(adder.id).to eq(31)
      expect(adder.sca_name).to eq('')
      expect(adder.email).to eq('')
      expect(adder.vigilant).to be_truthy
      expect(adder.peerage).to eq(:laurel)
    end
    it 'should return exisiting user on successful save' do
      existing_user = create(:user)
      adder = UserAdder.new(id: existing_user.id, sca_name: existing_user.sca_name, email: existing_user.email, vigilant: true, peerage: :laurel)
      adder.add
      user = adder.user
      expect(user).to eq(existing_user)
    end 

    it 'does not duplicate peerages if user is already a given peerage' do
      existing_laurel = create(:laurel_peer, bio: 'I have a bio')
      existing_user = existing_laurel.user

      
      adder = UserAdder.new(id: existing_user.id, sca_name: existing_user.sca_name, email: existing_user.email, vigilant: true, peerage: :laurel)
      adder.add
      user = adder.user
      expect(user.peers.count).to eq(1)
      expect(user.laurel.bio).to eq('I have a bio')
    end
  end
end
describe UserAdder, 'send_email' do
    it "sends welcome and change password email to new  user and laurel" do
      adder = UserAdder.new(sca_name: "Dingus McDOOOGLE", email: "dingus@doogleson.com", peerage: :laurel)
      adder.add
      adder.send_email
      email = ActionMailer::Base.deliveries.last
      expect(email.to[0]).to eq("dingus@doogleson.com")
      expect(email.body).to include("To access Laurelate content, first")
    end
    it "sends email to exisiting pelican / new laurel that they now have access to laurel content" do
      user = create(:pelican_user, sca_name: 'Peter Pelican', email: 'pelican@example.com') 
      adder = UserAdder.new(id: user.id, peerage: :laurel)
      adder.add
      adder.send_email
      email = ActionMailer::Base.deliveries.last
      expect(email.to[0]).to eq("pelican@example.com")
      expect(email.body).to include("you will now have access to Laurelate content")
    end
    it "raises ArgumentError if user hasn't been added yet" do
      adder = UserAdder.new(sca_name: "Dingus", email: "example@example.com", peerage: :laurel)
      expect{adder.send_email}.to raise_error(ArgumentError)
    end
end
