require 'rails_helper'
require 'ballot'
describe Ballot, 'initialize' do
  before(:each) do
    @laurel = build(:laurel_peer)
    @past_poll = create(:past_poll)
    @current_poll = create(:current_poll)
  end
  it "initializes with current poll" do
    b = Ballot.new(@laurel)
    expect(b.poll).to eq(@current_poll)
  end
end

describe Ballot, 'validations' do
  it "rejects ballots with past poll" do
    @laurel = build(:laurel_peer)
    @past_poll = create(:past_poll)
    expect{Ballot.new(@laurel)}.to raise_error(ArgumentError)
  end
end
describe Ballot, "complete?" do
  before(:each) do
    @laurel = create(:laurel_peer)
    @candidate1 = create(:candidate)
    @candidate2 = create(:candidate)
    @current_poll = create(:current_poll)
    @advising1 = create(:advising, candidate: @candidate1, 
      poll: @current_poll, peer: @laurel, comment: 'Comment', 
      judgement: :elevate, submitted: true)
    @advising2 = build(:advising, candidate: @candidate2, 
      poll: @current_poll, peer: @laurel, comment: 'Comment', 
      judgement: :elevate, submitted: true)
    @ballot = Ballot.new(@laurel)
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
    @laurel = create(:laurel_peer)
    @candidate1 = create(:candidate)
    @candidate2 = create(:candidate)
    @current_poll = create(:current_poll)
    @advising1 = create(:advising, candidate: @candidate1, 
      poll: @current_poll, peer: @laurel, comment: 'Comment', 
      judgement: :elevate, submitted: true)

    @advising2 = build(:advising, candidate: @candidate2, 
      poll: @current_poll, peer: @laurel, comment: 'Comment', 
      judgement: :elevate, submitted: true)
    @ballot = Ballot.new(@laurel)
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
    @laurel = create(:laurel_peer)
    @candidate = create(:candidate)
    @poll = create(:current_poll)
    @ballot = Ballot.new(@laurel)
    @advising = build(:advising, candidate: @candidate, 
      poll: @poll, peer: @laurel, comment: 'Comment', 
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
describe Ballot, 'percent_complete' do
  context "at least 2 candidates" do
    before(:each) do
      @laurel = create(:laurel_peer)
      @poll = create(:current_poll)
      @candidate1 = create(:candidate, sca_name: "Candidate1")
      @candidate2 = create(:candidate, sca_name: "Candidate2")
      @advising1 = build(:advising, candidate: @candidate1, 
        poll: @poll, peer: @laurel, comment: 'Comment', 
        judgement: :elevate, submitted: true)

      @advising2 = build(:advising, candidate: @candidate2, 
        poll: @poll, peer: @laurel, comment: 'Comment', 
        judgement: :elevate, submitted: true)
      @ballot = Ballot.new(@laurel)
    end
    it "shows 0% complete for 0 of 2 completed submissions" do
      expect(@ballot.percent_complete).to eq(0)
    end
    it "shows 50% complete for 1 of 2 completed submissions" do
      @advising1.save
      expect(@ballot.percent_complete).to eq(50)
    end
    it "shows 100% complete for 2 of 2 completed submissions" do
      @advising1.save
      @advising2.save
      expect(@ballot.percent_complete).to eq(100)
    end
    it "shows 33% compete for 1 of 3 completed submissions" do
      @advising1.save
      create(:candidate, sca_name: 'candidate3') 
      expect(@ballot.percent_complete).to eq(33)
    end
  end
  it "shows 0 for no candidates" do
    create(:current_poll)
    laurel = create(:laurel_peer)
    ballot = Ballot.new(laurel)
    expect(ballot.percent_complete).to eq(0)
  end
end
