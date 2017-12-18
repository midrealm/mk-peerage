require 'rails_helper'
require 'results_calculator'
describe "calculate" do
  before(:each) do
    @candidate = create(:candidate)
    @rc = ResultsCalculator.new
  end
  it "does not create PollResults for if Poll results already exist" do
    p = create(:poll)
    c = create(:candidate)
    poll_result = create(:poll_result, poll: p, candidate: c)    
    expect(PollResult.count).to eq(1)
    @rc.calculate 
    expect(PollResult.count).to eq(1)
  end

  it "does not create Poll Results for current poll" do
      @current_poll = build(:poll, start_date: DateTime.now - 2.days, end_date: DateTime.now + 1.day)
      @current_poll.save(validate: false)
      @user = create(:user)

      @advising = create(:advising, candidate: @candidate, peer: @user.peer, poll: @current_poll, submitted: true, judgement: @elevate) 
      @rc.calculate
      expect(PollResult.count).to eq(0)    
  end

  it "does not create Poll Results for future poll" do
      @future = create(:poll, start_date: DateTime.now + 1.days, end_date: DateTime.now + 2.day)
      @user = create(:user)

      #this is advising isn't possible anyway)
      @advising = create(:advising, candidate: @candidate, peer: @user.peer, poll: @future_poll, submitted: true, judgement: @elevate) 
      @rc.calculate
      expect(PollResult.count).to eq(0)    
  end

  context "past poll" do
    before(:each) do
      @past_poll = build(:poll, start_date: DateTime.now - 2.days, end_date: DateTime.now - 1.day)
      @past_poll.save(validate: false)
      @user1 = create(:user)
      @user2 = create(:user)
      @user3 = create(:user)
      @user4 = create(:user)
      @user5 = create(:user)
      @advising1 = build(:advising, candidate: @candidate, peer: @user1.peer, poll: @past_poll, submitted: true) 
      @advising2 = build(:advising, candidate: @candidate, peer: @user2.peer, poll: @past_poll, submitted: true) 
      @advising3 = build(:advising, candidate: @candidate, peer: @user3.peer, poll: @past_poll, submitted: true) 
      @advising4 = build(:advising, candidate: @candidate, peer: @user4.peer, poll: @past_poll, submitted: true) 
      @advising5 = build(:advising, candidate: @candidate, peer: @user5.peer, poll: @past_poll, submitted: true) 
      
    end

    it "creates PollResult for candidates" do
      expect(PollResult.count).to eq(0)
      @advising1.save
      @rc.calculate
      expect(PollResult.count).to eq(1)
    end
    it "creates poll results for past poll even when there's a scheduled poll" do
      future = create(:poll, start_date: DateTime.now + 1.days, end_date: DateTime.now + 2.day)
      @advising1.save
      @rc.calculate
      expect(PollResult.count).to eq(1)
      
    end
    it "computes result calculations for given candidate" do
      @advising1.judgement = :elevate
      @advising1.save
      @advising2.judgement = :elevate
      @advising2.save

      calculations = @rc.calculate
      result = PollResult.last
      expect(result.elevate).to eq(2)
      expect(result.drop).to eq(0)
      expect(result.wait).to eq(0)
      expect(result.no_strong_opinion).to eq(0)
    end

    it "computes calculations for multiple candidates" do
      @advising1.judgement = :wait
      @advising1.save
      
      candidate2 = create(:candidate)
      @advising2.candidate = candidate2
      @advising2.judgement = :elevate
      @advising2.save

      calculations = @rc.calculate
      expect(PollResult.count).to eq(2)
      expect(PollResult.find_by(candidate: @candidate).wait).to eq(1)
      expect(PollResult.find_by(candidate: @candidate).elevate).to eq(0)

      expect(PollResult.find_by(candidate: candidate2).wait).to eq(0)
      expect(PollResult.find_by(candidate: candidate2).elevate).to eq(1)
    end

    it "handles candidate with no advisings" do
      calculations =  @rc.calculate
      expect(PollResult.count).to be(0) 
    end
  end
  
end
