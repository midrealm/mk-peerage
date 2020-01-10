require 'rails_helper'

RSpec.describe PollResult, type: :model do
end
RSpec.describe PollResult, 'advisings' do
  context 'for some set of things' do
    before(:each) do
      laurel = create(:laurel_peer)
      laurel2 = create(:laurel_peer)
      candidate = create(:laurel_candidate)
      poll = create(:past_poll)
      @pr = build(:poll_result, candidate: candidate, poll: poll)
      advising = create(:advising, poll: poll, peer: laurel, candidate: candidate,
        comment: 'I like this candidate, but not ready yet', 
        judgement: :elevate)
    end
    it 'should return saved advisings' do
      expect(@pr.advisings.count).to eq(1)
    end
  end
end


