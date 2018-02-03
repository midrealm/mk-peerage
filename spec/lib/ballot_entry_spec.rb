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
      @b = BallotEntry.new(candidate: @candidate, peer:@laurel)
    end
    it "returns advising for current poll if current exists" do
      advising = create(:advising, candidate: @candidate, peer: @laurel, poll: @poll, judgement: :elevate,
        comment: 'comment comment comment')     
      expect(@b.advising).to eq(advising) 
    end
    it "returns new advising with current poll if old poll entry exists" do
      past_advising = create(:advising, candidate: @candidate, peer: @laurel, 
        poll: @past_poll, judgement: :elevate, comment: 'comment comment comment')
      expect(@b.advising.judgement).to eq(past_advising.judgement)
      expect(@b.advising.comment).to eq(past_advising.comment)
      expect(@b.advising.poll).to eq(@poll)
    end

    it 'returns updates advising to have new poll id if old poll id is nil' do
      past_advising = create(:advising, candidate: @candidate, peer: @laurel, 
        poll: @past_poll, judgement: :elevate, comment: 'comment comment comment')
      nil_advising = create(:advising, candidate: @candidate, peer: @laurel, 
        poll_id: nil, judgement: :wait, comment: 'comment1 comment1 comment1')
      expect(Advising.count).to eq(2)
      expect(@b.advising.judgement).to eq(nil_advising.judgement)
      expect(@b.advising.comment).to eq(nil_advising.comment)
      expect(@b.advising.poll).to eq(@poll)
      expect(Advising.count).to eq(2)
    end
    it "returns newly created empty advising when no past or nil or current advising exists" do 
      expect(Advising.count).to eq(0)
      expect(@b.advising.poll).to eq(@poll)
      expect(@b.advising.comment).to be_nil
      expect(@b.advising.judgement).to be_nil
      expect(Advising.count).to eq(1)
    end
  end
end
