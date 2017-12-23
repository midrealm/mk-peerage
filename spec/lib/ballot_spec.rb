require 'rails_helper'
require 'ballot'
describe Ballot, 'initialize' do
  before(:each) do
    @candidate = create(:candidate)
    @laurel = create(:user)
    @past_poll = create(:past_poll)
    @current_poll = create(:current_poll)
  end
  it "initializes with current poll" do
    b = Ballot.new(@laurel.laurel)
    expect(b.poll).to eq(@current_poll)
  end
end

describe Ballot, 'validations' do
  it "rejects ballots with past poll" do
    @candidate = create(:candidate)
    @laurel = create(:user)
    @past_poll = create(:past_poll)
    expect{Ballot.new(@laurel.laurel)}.to raise_error(ArgumentError)
  end
end
describe Ballot, "complete?" do
  before(:each) do
    @laurel = create(:user)
    @candidate1 = create(:candidate)
    @candidate2 = create(:candidate)
    @current_poll = create(:current_poll)
    @advising1 = create(:advising, candidate: @candidate1, 
      poll: @current_poll, peer: @laurel.laurel, comment: 'Comment', 
      judgement: :elevate, submitted: true)
    @advising2 = build(:advising, candidate: @candidate2, 
      poll: @current_poll, peer: @laurel.laurel, comment: 'Comment', 
      judgement: :elevate, submitted: true)
    @ballot = Ballot.new(@laurel.laurel)
  end

  it "returns true if the peer has completed the ballot for a given poll" do
    @advising2.save
    expect(@ballot.complete?).to be_truthy
  end
  it "returns false if the peer has not completed the ballot for a given poll" do
    expect(@ballot.complete?).to be_falsy
  end
  it 'returns false if ballot entries have been started but not submitted' do
    @advising2.submitted = false
    @advising2.save
    expect(@ballot.complete?).to be_falsy
  end
end
describe Ballot, "submission_count" do
  
  before(:each) do
    @laurel = create(:user)
    @candidate1 = create(:candidate)
    @candidate2 = create(:candidate)
    @current_poll = create(:current_poll)
    @advising1 = create(:advising, candidate: @candidate1, 
      poll: @current_poll, peer: @laurel.laurel, comment: 'Comment', 
      judgement: :elevate, submitted: true)

    @advising2 = build(:advising, candidate: @candidate2, 
      poll: @current_poll, peer: @laurel.laurel, comment: 'Comment', 
      judgement: :elevate, submitted: true)
    @ballot = Ballot.new(@laurel.laurel)
  end
  it 'returns number of submitted poll entries for current poll if all submitted' do
    @advising2.save
    expect(@ballot.submission_count).to eq(2) 
  end

  it 'returns number of submitted poll entries for incomplete poll where an entry exists but has not been submitted' do
    @advising2.submitted = false
    @advising2.save 
    expect(@ballot.submission_count).to eq(1) 
  end
  it 'returns number of submitted poll entries for incomplete poll where a candidate advising does not exist' do
    expect(@ballot.submission_count).to eq(1) 
  end
end
describe Ballot, "submission_for(candidate)" do
  before(:each) do
    @laurel = create(:user)
    @candidate = create(:candidate)
    @poll = create(:current_poll)
    @ballot = Ballot.new(@laurel.laurel)
    @advising = build(:advising, candidate: @candidate, 
      poll: @poll, peer: @laurel.laurel, comment: 'Comment', 
      judgement: :elevate, submitted: true)
  end
  it "returns true if user has a submitted advising for given poll" do
    @advising.save
    expect(@ballot.submission_for?(@candidate)).to be_truthy
  end

  it "returns false if there is no advising for current poll" do
    expect(@ballot.submission_for?(@candidate)).to be_falsey
  end

  it "returns false if there is an advising but it hasn't been submitted" do
    @advising.submitted = false
    @advising.save
    expect(@ballot.submission_for?(@candidate)).to be_falsey
  end
end
