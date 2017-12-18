require 'rails_helper'

RSpec.describe Advising, type: :model do
  it {should belong_to(:candidate)}
  it {should belong_to(:peer)}
  it {should belong_to(:poll)}
end

RSpec.describe Advising, 'judgement_name' do
  before(:each) do
    @laurel = create(:user)
  end
  context 'for Watch list Candidate' do
    before(:each) do
      @candidate = create(:candidate, peerage_type: :laurel, vote: false)
      @advising = build(:advising, peer: @laurel.peers.first, candidate: @candidate)
    end
    it "should print 'Elevate to Vote List' for :elevate judgement" do
      @advising.judgement = :elevate
      @advising.save
      expect(@advising.judgement_name).to eq('Elevate to Vote List')
    end 
    it "should print 'Wait' for :wait judgement" do
      @advising.judgement = :wait
      @advising.save
      expect(@advising.judgement_name).to eq('Wait')
    end 
    it "should print 'No Strong Opinion' for :no_strong_opinion judgement" do
      @advising.judgement = :no_strong_opinion
      @advising.save
      expect(@advising.judgement_name).to eq('No Strong Opinion')
    end 
    it "should print 'Drop from Watch List' for :drop judgement" do
      @advising.judgement = :drop
      @advising.save
      expect(@advising.judgement_name).to eq('Drop from Watch List')
    end 
  end
  context 'for Vote list Candidate' do
    before(:each) do
      @candidate = create(:candidate, peerage_type: :laurel, vote: true)
      @advising = build(:advising, peer: @laurel.peers.first, candidate: @candidate)
    end
    it "should print 'Elevate to Peerage List' for :elevate judgement" do
      @advising.judgement = :elevate
      @advising.save
      expect(@advising.judgement_name).to eq('Elevate to Peerage')
    end 
    it "should print 'Wait' for :wait judgement" do
      @advising.judgement = :wait
      @advising.save
      expect(@advising.judgement_name).to eq('Wait')
    end 
    it "should print 'No Strong Opinion' for :no_strong_opinion judgement" do
      @advising.judgement = :no_strong_opinion
      @advising.save
      expect(@advising.judgement_name).to eq('No Strong Opinion')
    end 
    it "should print 'Drop from Watch List' for :drop judgement" do
      @advising.judgement = :drop
      @advising.save
      expect(@advising.judgement_name).to eq('Drop to Watch List')
    end 
  end
end
