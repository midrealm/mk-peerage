require 'rails_helper'
describe OfflineBallot, 'peers' do
  before(:each) do
    @peer = create(:laurel_peer)
    user2 = create(:laurel_user, sca_name: 'Mundungus Blahblah')
    @peer2 = user2.laurel
    @candidate = create(:laurel_candidate, vote: true)
    @poll = create(:active_poll)
    @ballot = OfflineBallot.new(:laurel)
  end
  it "only shows peers who have not yet completed a ballot" do
    create(:advising, poll: @poll, peer: @peer, candidate: @candidate)
    expect(@ballot.peers.count).to eq(1)
    expect(@ballot.peers.first.sca_name).to eq(@peer2.sca_name)
  end
end
describe OfflineBallot, 'validations' do
  context "vote list candidate" do
    before(:each) do
      @peer = create(:laurel_peer)
      @candidate = create(:laurel_candidate, vote: true)
      poll = create(:active_poll)
      @ballot = OfflineBallot.new(:laurel)
      @attributes = {"peer_id" => @peer.id, vote_list_advisings_attributes: {0 => { "candidate_id" => @candidate.id, "judgement" => "no_strong_opinion", "comment" => 'It is a comment.'}} }
    end
    it 'is valid if there is a peer_id and filled in poll stuff' do
      @ballot.assign_attributes(@attributes)
      expect(@ballot.valid?).to be_truthy
    end
    it 'is invalid if there is no peer_id' do
      @attributes[:peer_id] = nil
      @ballot.assign_attributes(@attributes)
      expect(@ballot.valid?).to be_falsey
    end
    it 'is invalid if a judgement is empty' do
      @attributes[:vote_list_advisings_attributes][0][:judgement] = nil
      @ballot.assign_attributes(@attributes)
      expect(@ballot.valid?).to be_falsey
    end
  end
  context "watch list candidate" do
    before(:each) do
      @peer = create(:laurel_peer)
      @candidate = create(:laurel_candidate, vote: false)
      poll = create(:active_poll)
      @ballot = OfflineBallot.new(:laurel)
      @attributes = {"peer_id" => @peer.id, watch_list_advisings_attributes: {0 => { "candidate_id" => @candidate.id, "judgement" => "no_strong_opinion", "comment" => 'It is a comment.'}} }
    end
    it 'is valid if there is a peer_id and filled in poll stuff' do
      @ballot.assign_attributes(@attributes)
      expect(@ballot.valid?).to be_truthy
    end
    it 'is invalid if there is no peer_id' do
      @attributes[:peer_id] = nil
      @ballot.assign_attributes(@attributes)
      expect(@ballot.valid?).to be_falsey
    end
    it 'is invalid if a judgement is empty' do
      @attributes[:watch_list_advisings_attributes][0][:judgement] = nil
      @ballot.assign_attributes(@attributes)
      expect(@ballot.valid?).to be_falsey
    end
  end

end

describe OfflineBallot, 'save' do
  context "vote list candidate" do
    before(:each) do
      @peer = create(:laurel_peer)
      @candidate = create(:laurel_candidate, vote: true)
      poll = create(:active_poll)
      @ballot = OfflineBallot.new(:laurel)
      @attributes = {"peer_id" => @peer.id, vote_list_advisings_attributes: {0 => { "candidate_id" => @candidate.id, "judgement" => "no_strong_opinion", "comment" => 'It is a comment.'}} }
    end
    it "saves a valid ballot" do
      @ballot.assign_attributes(@attributes)
      @ballot.save
      expect(Advising.count).to eq(1)
    end
    it "does not save an invalid ballot" do
      @attributes[:vote_list_advisings_attributes][0][:judgement] = nil
      @ballot.assign_attributes(@attributes)
      @ballot.save
      expect(Advising.count).to eq(0)
    end
  end
  context "watch list candidate" do
    before(:each) do
      @peer = create(:laurel_peer)
      @candidate = create(:laurel_candidate, vote: false)
      poll = create(:active_poll)
      @ballot = OfflineBallot.new(:laurel)
      @attributes = {"peer_id" => @peer.id, watch_list_advisings_attributes: {0 => { "candidate_id" => @candidate.id, "judgement" => "no_strong_opinion", "comment" => 'It is a comment.'}} }
    end
    it "saves a valid ballot" do
      @ballot.assign_attributes(@attributes)
      @ballot.save
      expect(Advising.count).to eq(1)
    end
    it "does not save an invalid ballot" do
      @attributes[:watch_list_advisings_attributes][0][:judgement] = nil
      @ballot.assign_attributes(@attributes)
      @ballot.save
      expect(Advising.count).to eq(0)
    end
  end
end
