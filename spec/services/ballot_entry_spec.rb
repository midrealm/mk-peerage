require 'rails_helper'
describe BallotEntry, 'initialize' do
  before(:each) do
    @candidate = create(:candidate)
    @laurel = create(:laurel_peer)
    @past_poll = create(:past_poll)
    @current_poll = create(:current_poll)
  end
  it "initializes with current poll" do
    b = BallotEntry.new(peer: @laurel, candidate:@candidate)
    expect(b.poll).to eq(@current_poll)
  end
end

describe BallotEntry, 'validations' do
  it "rejects ballot entries where there is no current poll for candidate's peerage" do
    candidate = build(:candidate)
    laurel = build(:laurel_peer)
    past_poll = create(:past_poll)
    expect{BallotEntry.new(peer: laurel, candidate: candidate)}.to raise_error(ArgumentError)
  end
  it "rejects ballot entries where peerage and candidate order don't match" do
    candidate = build(:laurel_candidate)
    pelican = build(:pelican_peer)
    current_poll = create(:current_poll)
    expect{BallotEntry.new(peer: pelican, candidate: candidate)}.to raise_error(ArgumentError)
  end
end


describe BallotEntry, "advising" do
  before(:each) do
    @candidate = create(:candidate, vote: true)
    @laurel = create(:laurel_peer)
  end
  context "for active poll and past poll" do
    before(:each) do
      @past_poll = create(:past_poll)
      @poll = create(:current_poll)
    end
    it "returns empty advising if no previously saved advising for current poll" do
      b = BallotEntry.new(candidate: @candidate, peer:@laurel)
      expect(b.advising.poll).to eq(@poll)
      expect(b.advising.comment).to eq('')
      expect(b.advising.judgement).to be_nil
    end
    it "returns empty advising if no previously saved advising for current poll even if advisings for candidate were saved in previous polls" do
      advising = create(:advising, candidate: @candidate, peer: @laurel, poll: @past_poll, judgement: :elevate,
        comment: 'comment comment comment')     
      b = BallotEntry.new(candidate: @candidate, peer:@laurel)
      expect(b.advising.comment).to eq('')
      expect(b.advising.judgement).to be_nil
    end
    it "returns advising for current poll if current exists" do
      advising = create(:advising, candidate: @candidate, peer: @laurel, poll: @poll, judgement: :elevate,
        comment: 'comment comment comment')     
      b = BallotEntry.new(candidate: @candidate, peer:@laurel)
      expect(b.advising.comment).to eq(advising.comment)
      expect(b.advising.judgement).to eq(advising.judgement)
    end
  end
end
describe BallotEntry, "old_advisings?" do
  before(:each) do
    @candidate = create(:candidate, vote: true)
    @laurel = create(:laurel_peer)
    poll = create(:current_poll)
    @ballot_entry = BallotEntry.new(candidate: @candidate, peer: @laurel)
  end
  it "returns false if no previous advisings" do
    expect(@ballot_entry.old_advisings?).to be_falsey
  end
  it "returns true if there is an old advising for candidate by peer" do
    past_poll = create(:past_poll)
    create(:advising, poll: past_poll, candidate: @candidate, peer: @laurel)
    expect(@ballot_entry.old_advisings?).to be_truthy
  end
end
describe BallotEntry, "old_advisings" do
  before(:each) do
    @candidate = create(:candidate, vote: true)
    @laurel = create(:laurel_peer)
    @poll = create(:current_poll)
    past_poll = create(:past_poll)
    create(:advising, poll: past_poll, candidate: @candidate, peer: @laurel)
  end
  it "returns advisings from previous polls" do
    ballot_entry = BallotEntry.new(candidate: @candidate, peer: @laurel)
    expect(ballot_entry.old_advisings.count).to eq(1)
  end
  it "does not return saved advising from current poll" do
    create(:advising, poll: @poll, candidate: @candidate, peer: @laurel) 
    ballot_entry = BallotEntry.new(candidate: @candidate, peer: @laurel)
    expect(Advising.count).to eq(2)
    expect(ballot_entry.old_advisings.count).to eq(1)
  end
end
