require 'rails_helper'

RSpec.describe Group, type: :model do
end

RSpec.describe Group, 'peers_of(peerage_type)' do
  before(:each) do
    @group = create(:group, name: 'High Haven')
    @laurel1 = create(:laurel_user, group_id: @group.id)
    @laurel2 = create(:laurel_user, sca_name: 'The Second', group_id: @group.id)
    @pelican = create(:pelican_user, sca_name: 'Token Pelican', group_id: @group.id)
  end

  it "returns only peers of given peerage for given group" do
    peers = @group.peers_of(:laurel)
    expect(peers.count).to eq(2)
    expect(peers.first.order).to eq(:laurel)
    expect(peers.second.order).to eq(:laurel)
    expect(@group.peers.count).to eq(3)
  end
  
end
RSpec.describe Group, 'all_peers(peerage_type)' do
  before(:each) do
    @group = create(:group, name: 'High Haven')
    @child = create(:group, name: 'The Barrows', parent_id: @group.id)
    @grand_child = create(:group, name: 'The Corner', parent_id: @child.id) 
    @laurel1 = create(:user, group_id: @group.id)
    @laurel2 = create(:user, sca_name: 'The Second', group_id: @child.id)
    @laurel3 = create(:user, sca_name: 'The Third', group_id: @grand_child.id)
    @candidate = create(:candidate, group_id: @group.id)
  end

  it 'lists all laurels in descendent groups' do
    expect(@group.all_peers(:laurel).count).to eq(3)
  end 

  it 'is a list of laurels' do
    expect(@group.all_peers(:laurel).first.order).to eq(:laurel)
  end

end

RSpec.describe Group, 'all_candidates' do
  before(:each) do
    @group = create(:group, name: 'High Haven')
    @child = create(:group, name: 'The Barrows', parent_id: @group.id)
    @grand_child = create(:group, name: 'The Corner', parent_id: @child.id) 
    @cand1 = create(:candidate, group_id: @group.id)
    @cand2 = create(:candidate, sca_name: 'The Second', group_id: @child.id)
    @cand3 = create(:candidate, sca_name: 'The Third', group_id: @grand_child.id)
    @laurel = create(:user, group_id: @group.id)
  end

  it 'lists all laurels in descendent groups' do
    expect(@group.all_candidates('laurel').count).to eq(3)
  end 

end
