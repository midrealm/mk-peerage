require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:sca_name)}
  
  it "rejects bad emails" do
    user = build(:laurel_user, email: 'bademail')
    user.save
    expect(User.count).to eq(0)
  end
end

RSpec.describe User, 'set_slug' do
  it 'should save slug' do
    user = build(:laurel_user, sca_name: 'Heregyð Ketilsdóttir')
    user.save 
    expect(User.last.slug).to eq('heregyd_ketilsdottir')
  end
end
RSpec.describe User, "enforce_parent_specialty" do
  before :each do
    @parent = create(:specialty, name: 'Parent')
    @child = create(:specialty, name: 'Child', parent_id: @parent.id)
    @user = create(:laurel_user)
  end
  it "sets parent specialty if child specialty selected and parent specializaiton doesn't already exit" do
    @user.update_attributes( :laurel_attributes => {id: @user.laurel.id, :specialty_ids => [@child.id]})
    expect(@user.laurel.specialties.count).to eq(2)
  end
  it "only sets one parent specialization even if two new children created" do
    child2 = create(:specialty, name: 'Child2', parent_id: @parent.id) 
    @user.update_attributes( :laurel_attributes => {id: @user.laurel.id, :specialty_ids => [@child.id, child2.id]})
    expect(@user.laurel.specialties.count).to eq(3)
  end
  it "sets only one parent if child and parent selected" do
    @user.update_attributes( :laurel_attributes => {id: @user.laurel.id, :specialty_ids => [@child.id, @parent.id]})
    expect(@user.laurel.specialties.count).to eq(2)
  end
end

RSpec.describe User, 'self.add_new(id, sca_name, email, vigilant, peerage)' do
  context 'for totally new user' do
    it 'should return user with given associated peer on successful save' do
      user = User.add_new(id: nil, sca_name: 'Default User', email: 'example@example.com', vigilant: true, peerage: :laurel)
      expect(user.class.name).to eq('User') 
      expect(user).to eq(User.last)
      expect(user.laurel).to eq(Laurel.last)
    end

    it 'should set defaults for new laurel' do
      user = User.add_new(id: nil, sca_name: 'Default User', email: 'example@example.com', vigilant: nil, peerage: :laurel)
      laurel = user.laurel
      expect(laurel.active).to be_truthy
      expect(laurel.vigilant).to be_truthy 
      expect(user.royalty).to be_falsy
      expect(user.deceased).to be_falsy
    end

    it 'should set vigilant false on peer when vigilant set to false' do
      user = User.add_new(id: nil, sca_name: 'Default User', email: 'example@example.com', vigilant: false, peerage: :laurel)
      expect(user.laurel.vigilant).to be_falsy
    end

    it 'returns user with id nil for bad input' do
      user = User.add_new(id: nil, sca_name: '', email: '', vigilant: false, peerage: :laurel)
      expect(user.id).to be_nil
    end

  end

  context 'for adding new peerage to existing user' do
    it 'should return exisiting user on successful save' do
      existing_user = create(:user)
      user = User.add_new(id: existing_user.id, sca_name: existing_user.sca_name, email: existing_user.email, vigilant: true, peerage: :laurel)
      expect(user).to eq(existing_user)
    end 

    it 'does not duplicate peerages if user is already a given peerage' do
      existing_laurel = create(:laurel_peer, bio: 'I have a bio')
      existing_user = existing_laurel.user

      user = User.add_new(id: existing_user.id, sca_name: existing_user.sca_name, email: existing_user.email, vigilant: true, peerage: :laurel)
      expect(user.peers.count).to eq(1)
      expect(user.laurel.bio).to eq('I have a bio')
    end
  end
end

RSpec.describe User, 'self.all_except(peerage)' do
  context "for :laurel" do
    it 'returns all non-laurel users' do
      laurel = create(:laurel_user, sca_name: 'Lucy Laurel')
      pelican = create(:pelican_user, sca_name: 'Peter Pelican')
      users = User.all_except(:laurel)
      expect(users.exists?(sca_name: 'Lucy Laurel')).to be_falsy
      expect(users.exists?(sca_name: 'Peter Pelican')).to be_truthy
    end
  end
end

RSpec.describe User, 'set_deceased' do
  it 'should set active to false if user is deceased' do
    user = create(:laurel_user)
    expect(User.last.deceased).to be_falsy
    expect(Peer.last.active).to eq(true)
    user.update(deceased: true)
    expect(User.last.deceased).to eq(true)
    expect(Peer.last.active).to eq(false)
  end
  it 'should handle not setting active on deceased royal' do
   royal = create(:royal)
   expect(User.last.deceased).to be_falsy
   royal.update(deceased: true)
   expect(User.last.deceased).to eq(true) 
  end
end


