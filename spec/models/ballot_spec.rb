require 'rails_helper'

describe Ballot, "set_seed" do
  before(:each) do
    @laurel = create(:laurel_peer)
    @poll = create(:current_poll)
  end
  it "sets the ballot seed after creating ballot" do
    Ballot.create(peer: @laurel, poll: @poll)
    expect(Ballot.first.seed).not_to be_nil
  end

  it "sets different ballot seeds for each ballot" do
    new_laurel = create(:laurel_peer)
    b1 = Ballot.create(peer: @laurel, poll: @poll)
    b2 = Ballot.create(peer: new_laurel, poll: @poll)
    expect(b1.seed).not_to eq(b2.seed)
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
      judgement: :elevate)
    @advising2 = build(:advising, candidate: @candidate2, 
      poll: @current_poll, peer: @laurel, comment: 'Comment', 
      judgement: :elevate)
    @ballot = create(:ballot, peer: @laurel, poll: @current_poll)
  end

  it "returns true if the peer has completed the ballot for a given poll" do
    @advising2.save
    expect(@ballot.complete?).to be_truthy
  end
  it "returns false if the peer has not completed the ballot for a given poll" do
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
      judgement: :elevate)

    @advising2 = build(:advising, candidate: @candidate2, 
      poll: @current_poll, peer: @laurel, comment: 'Comment', 
      judgement: :elevate)
    @ballot = create(:ballot, peer: @laurel, poll: @current_poll)
  end
  it 'returns number of advisings saved for current poll' do
    @advising2.save
    expect(@ballot.submission_count).to eq(2) 
  end

  it 'returns number of advisings saved where some candidates do not yet have saved advising' do
    expect(@ballot.submission_count).to eq(1) 
  end
end
describe Ballot, "submission_for(candidate)" do
  before(:each) do
    @laurel = create(:laurel_peer)
    @candidate = create(:candidate)
    @poll = create(:current_poll)
    @ballot = create(:ballot, peer: @laurel, poll: @poll)
    
    @advising = build(:advising, candidate: @candidate, 
      poll: @poll, peer: @laurel, comment: 'Comment', 
      judgement: :elevate)
  end
  it "returns true if user has a saved advising for given poll" do
    @advising.save
    expect(@ballot.submission_for?(@candidate)).to be_truthy
  end

  it "returns false if there is no advising for current poll" do
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
        judgement: :elevate)

      @advising2 = build(:advising, candidate: @candidate2, 
        poll: @poll, peer: @laurel, comment: 'Comment', 
        judgement: :elevate)
      @ballot = create(:ballot, peer: @laurel, poll: @poll)
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
    poll = create(:current_poll)
    laurel = create(:laurel_peer)
    ballot = create(:ballot, peer: laurel, poll: poll)
    expect(ballot.percent_complete).to eq(0)
  end
end
