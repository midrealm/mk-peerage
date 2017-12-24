require 'rails_helper'

RSpec.describe PollResult, type: :model do
  it { should belong_to(:candidate) }
  it { should belong_to(:poll) }
end
RSpec.describe PollResult, 'advisings' do
  context 'for some set of things' do
    before(:each) do
      laurel = create(:user)
      laurel2 = create(:user, sca_name: 'second laurel')
      candidate = create(:candidate)
      poll = create(:past_poll)
      @pr = create(:poll_result, candidate: candidate, poll: poll, wait: 1)
      advising = create(:advising, poll: poll, peer: laurel.laurel, candidate: candidate,
        comment: 'I like this candidate, but not ready yet', submitted: true, 
        judgement: :elevate)
      unsubmitted_advising = create(:advising, poll: poll, peer: laurel2.laurel, candidate: candidate,
        comment: 'I like this candidate, but not ready yet', submitted: false, 
        judgement: :elevate)
    end
    it 'should return submitted advisings' do
      expect(@pr.advisings.count).to eq(1)
    end
  end
end


