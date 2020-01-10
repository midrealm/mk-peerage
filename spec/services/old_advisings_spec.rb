require 'rails_helper'
describe OldAdvisings, 'advisings' do
  before(:each) do
    @candidate = create(:candidate, vote: true)
    @laurel = create(:laurel_peer)
    @poll = create(:current_poll)
    past_poll = create(:past_poll)
    create(:advising, poll: past_poll, candidate: @candidate, peer: @laurel, comment: "I am a tree")
  end
  it "returns advisings from previous polls" do
    old = OldAdvisings.new(candidate: @candidate, peer: @laurel)
    expect(old.advisings.count).to eq(1)
  end
  it "does not return saved advising from current poll" do
    create(:advising, poll: @poll, candidate: @candidate, peer: @laurel) 
    old = OldAdvisings.new(candidate: @candidate, peer: @laurel)
    expect(Advising.count).to eq(2)
    expect(old.advisings.count).to eq(1)
    expect(old.advisings.first.comment).to eq("I am a tree")
  end
end
describe OldAdvisings, 'any?' do
  before(:each) do
    @candidate = create(:candidate, vote: true)
    @laurel = create(:laurel_peer)
    current = create(:current_poll)
    create(:advising, poll: current, candidate: @candidate, peer: @laurel, comment: "I am a tree")
  end
  it "returns false if there aren't any old advisings" do
    old = OldAdvisings.new(candidate: @candidate, peer: @laurel)
    expect(old.any?).to be_falsey
  end
  it "returns true if there are any past polls" do
    past = create(:past_poll)
    create(:advising, poll: past, candidate: @candidate, peer: @laurel) 
    old = OldAdvisings.new(candidate: @candidate, peer: @laurel)
    expect(old.any?).to be_truthy
  end
end
