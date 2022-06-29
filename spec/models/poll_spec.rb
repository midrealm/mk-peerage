require 'rails_helper'

RSpec.describe Poll, type: :model do
  it 'does not accept end_dates after start_dates' do
    poll = build(:poll, start_date: DateTime.now + 2.days, end_date: DateTime.now + 1.days)
    expect(poll.valid?).to be_falsey
  end

  it 'does not accept start_dates in the past' do
    poll = build(:poll, start_date: DateTime.now - 3.day, end_date: DateTime.now + 1.day)
    expect(poll.valid?).to be_falsey
  end
  it "accepts polls with start_date of today" do
    poll = build(:poll, start_date: DateTime.now, end_date: DateTime.now + 1.day)
    expect(poll.valid?).to be_truthy
  end

end

RSpec.describe Poll, 'total_respondents' do
  it "returns the total number of peers who have responded to a poll" do
    poll = create(:poll)
    candidate1 = create(:laurel_candidate)
    candidate2 = create(:laurel_candidate)
    candidate3 = create(:laurel_candidate)
    peer = create(:laurel_peer)
    peer2 = create(:laurel_peer)
    advising = create(:advising, poll: poll, candidate: candidate1, peer: peer)
    advising2 = create(:advising, poll: poll, candidate: candidate2, peer: peer)
    expect(poll.total_respondents).to eq(1)
  end
end

RSpec.describe Poll, 'self.last_for(:peerage)' do
  context 'for laurel poll and pelican poll' do 
    before(:each) do
      @laurel_poll = create(:poll, peerage_type: :laurel)
      @pelican_poll = create(:poll, peerage_type: :pelican)
    end 
    it "returns pelican poll" do
      expect(Poll.last_for(:pelican)).to eq(@pelican_poll)
    end
    it "returns laurel poll" do
      expect(Poll.last_for(:laurel)).to eq(@laurel_poll)
    end
  end
end

RSpec.describe Poll, 'self.last_published_for(:peerage)' do
  context 'for laurel poll and pelican poll' do 
    before(:each) do
      @laurel_poll = create(:past_published_poll, peerage_type: :laurel, start_date: DateTime.now - 10.days, end_date: DateTime.now - 6.days)
      create(:past_poll, peerage_type: :laurel, published: false)
      @pelican_poll = create(:past_published_poll, peerage_type: :pelican, start_date: DateTime.now - 10.days, end_date: DateTime.now - 6.days)
      create(:past_poll, peerage_type: :pelican, published: false)
    end 
    it "returns pelican poll" do
      expect(Poll.last_published_for(:pelican)).to eq(@pelican_poll)
    end
    it "returns laurel poll" do
      expect(Poll.last_published_for(:laurel)).to eq(@laurel_poll)
    end
  end
end


  
RSpec.describe Poll, 'self.current(:peerage)' do
  context 'for current laurel poll and pelican poll' do 
    before(:each) do
      @laurel_poll = create(:current_poll, peerage_type: :laurel)
      @pelican_poll = create(:current_poll, peerage_type: :pelican)
    end 
    it "returns pelican poll" do
      expect(Poll.current(:pelican)).to eq(@pelican_poll)
    end
    it "returns laurel poll" do
      expect(Poll.current(:laurel)).to eq(@laurel_poll)
    end
  end
  context 'for past laurel poll and pelican poll' do 
    before(:each) do
      @laurel_poll = create(:past_published_poll, peerage_type: :laurel)
      @pelican_poll = create(:past_published_poll, peerage_type: :pelican)
    end 
    it "returns nil for pelican poll" do
      expect(Poll.current(:pelican)).to eq(nil)
    end
    it "returns nil for laurel poll" do
      expect(Poll.current(:laurel)).to eq(nil)
    end
  end
  context 'for future and current laurel poll and pelican poll' do 
    before(:each) do
      @current_l_poll = create(:current_poll, peerage_type: :laurel)
      @current_p_poll = create(:current_poll, peerage_type: :pelican)
      create(:future_poll, peerage_type: :laurel)
      create(:future_poll, peerage_type: :pelican)
    end 
    it "returns pelican poll" do
      expect(Poll.current(:pelican)).to eq(@current_p_poll)
    end
    it "returns laurel poll" do
      expect(Poll.current(:laurel)).to eq(@current_l_poll)
    end
  end
end
