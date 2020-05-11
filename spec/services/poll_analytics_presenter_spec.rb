require 'rails_helper'
describe PollAnalyticsPresenter, 'peers[n].started_poll?' do
  before(:each) do
    peer = create(:laurel_peer)
    candidate = create(:laurel_candidate)
    @poll = create(:current_poll)
    @advising = build(:advising, peer: peer, poll: @poll, candidate: candidate) 
  end
  it "returns true for peer who has started poll" do
    @advising.save
    pap = PollAnalyticsPresenter.new(@poll)
    expect(pap.peers[0].started_poll?).to be_truthy 
  end
  it "returns false for peer who has not started poll" do
    pap = PollAnalyticsPresenter.new(@poll)
    expect(pap.peers[0].started_poll?).to be_falsey 
  end
end
