require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_one(:peer) }

  it { should belong_to(:group) }
end

RSpec.describe User, 'set_slug' do
  it 'should save slug' do
    user = build(:user, sca_name: 'Heregyð Ketilsdóttir')
    user.save 
    expect(User.last.slug).to eq('heregyd_ketilsdottir')
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

RSpec.describe User, 'poll_complete?' do
  before(:each) do
    @laurel = create(:user)
    @candidate1 = create(:candidate)
    @candidate2 = create(:candidate)
    @current_poll = build(:poll, start_date: DateTime.now - 1.day)
    @current_poll.save(validate: false)
    @judgement = create(:judgement)
    @advising1 = create(:advising, candidate_id: @candidate1.id, 
      poll_id: @current_poll.id, peer: @laurel.peer, comment: 'Comment', 
      judgement_id: @judgement, submitted: true)

    @advising2 = build(:advising, candidate_id: @candidate2.id, 
      poll: @current_poll, peer: @laurel.peer, comment: 'Comment', 
      judgement_id: @judgement, submitted: true)
  end
  it 'should return true if user has completed the latest poll' do
    @advising2.save
    expect(@laurel.poll_complete?).to be_truthy
  end
  it 'should return false if user has not completed the latest poll' do
    expect(@laurel.poll_complete?).to be_falsey
  end

  it 'should return false if entry has been started but not submitted' do
    @advising2.submitted = false
    @advising2.save
    expect(@laurel.poll_complete?).to be_falsey
  end
end

RSpec.describe User, 'poll_submitted_count' do
  before(:each) do
    @laurel = create(:user)
    @candidate1 = create(:candidate)
    @candidate2 = create(:candidate)
    @current_poll = build(:poll, start_date: DateTime.now - 1.day)
    @current_poll.save(validate: false)
    @judgement = create(:judgement)
    @advising1 = create(:advising, candidate_id: @candidate1.id, 
      poll_id: @current_poll.id, peer: @laurel.peer, comment: 'Comment', 
      judgement_id: @judgement, submitted: true)

    @advising2 = build(:advising, candidate_id: @candidate2.id, 
      poll_id: @current_poll.id, peer: @laurel.peer, comment: 'Comment', 
      judgement_id: @judgement, submitted: true)
  end

  it 'returns number of submitted poll entries for current poll if all submitted' do
    @advising2.save
    expect(@laurel.poll_submitted_count).to eq(2) 
  end

  it 'returns number of submitted poll entries for incomplete poll where an entry exists but has not been submitted' do
    @advising2.submitted = false
    @advising2.save 
    expect(@laurel.poll_submitted_count).to eq(1) 
  end
  it 'returns number of submitted poll entries for incomplete poll where a candidate advising does not exist' do
    expect(@laurel.poll_submitted_count).to eq(1) 
  end
end
