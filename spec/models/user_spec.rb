require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:apprenticeships) }
  it { should have_many(:laurels).through(:apprenticeships) }
  
  it { should have_many(:advocacies) }
  it { should have_many(:candidates).through(:advocacies) }
  it { should have_many(:specializations) }

  it { should have_many(:specialties).through(:specializations) }
  it { should have_many(:comments) }

  it { should belong_to(:group) }
end

RSpec.describe User, 'set_slug' do
  it 'should save slug' do
    user = build(:user, sca_name: 'Heregyð Ketilsdóttir')
    user.save 
    expect(User.last.slug).to eq('heregyd_ketilsdottir')
  end
end

RSpec.describe User, 'poll_complete?' do
  before(:each) do
    @laurel = create(:user, laurel: true)
    @candidate1 = create(:candidate)
    @candidate2 = create(:candidate)
    @current_poll = build(:poll, start_date: DateTime.now - 1.day)
    @current_poll.save(validate: false)
    @judgement = create(:judgement)
    @advising1 = create(:advising, candidate_id: @candidate1.id, 
      poll_id: @current_poll.id, user_id: @laurel.id, comment: 'Comment', 
      judgement_id: @judgement, submitted: true)

    @advising2 = build(:advising, candidate_id: @candidate2.id, 
      poll_id: @current_poll.id, user_id: @laurel.id, comment: 'Comment', 
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
    @laurel = create(:user, laurel: true)
    @candidate1 = create(:candidate)
    @candidate2 = create(:candidate)
    @current_poll = build(:poll, start_date: DateTime.now - 1.day)
    @current_poll.save(validate: false)
    @judgement = create(:judgement)
    @advising1 = create(:advising, candidate_id: @candidate1.id, 
      poll_id: @current_poll.id, user_id: @laurel.id, comment: 'Comment', 
      judgement_id: @judgement, submitted: true)

    @advising2 = build(:advising, candidate_id: @candidate2.id, 
      poll_id: @current_poll.id, user_id: @laurel.id, comment: 'Comment', 
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
