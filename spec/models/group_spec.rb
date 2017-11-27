require 'rails_helper'

RSpec.describe Group, type: :model do
  it { should belong_to(:group_type) }
  it { should have_many(:users) }
  it { should have_many(:candidates) }
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
    expect(@group.all_peers('laurel').count).to eq(3)
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
    expect(@group.all_candidates.count).to eq(3)
  end 

end
