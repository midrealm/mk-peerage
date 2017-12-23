require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:peers) }

  it { should belong_to(:group) }
  it { should validate_presence_of(:sca_name)}
  
  it "rejects bad emails" do
    user = build(:user, email: 'bademail')
    user.save
    expect(User.count).to eq(0)
  end
end

RSpec.describe User, 'set_slug' do
  it 'should save slug' do
    user = build(:user, sca_name: 'Heregyð Ketilsdóttir')
    user.save 
    expect(User.last.slug).to eq('heregyd_ketilsdottir')
  end
end

RSpec.describe User, 'all_except_peerage(peerage)' do
  context "for :laurel" do
    it 'returns all non-laurel users' do
      laurel = create(:user, sca_name: 'Lucy Laurel')
      pelican = create(:pelican, sca_name: 'Peter Pelican')
      users = User.all_except_peerage(:laurel)
      expect(users.exists?(sca_name: 'Lucy Laurel')).to be_falsy
      expect(users.exists?(sca_name: 'Peter Pelican')).to be_truthy
    end
  end
end

RSpec.describe User, 'set_deceased' do
  it 'should set active to false if user is deceased' do
    user = create(:user)
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


