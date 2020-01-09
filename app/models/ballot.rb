class Ballot < ApplicationRecord
  belongs_to :peer
  belongs_to :poll
  before_create :set_seed

  def candidates
   Candidate.where_order(peer.order)
  end

  def complete?
    candidates.each do |cand|
      if poll.advisings.find_by(peer: peer, candidate: cand).nil?
        return false
      end
    end
    return true
  end

  def submission_count
    poll.advisings.where(peer: peer).count 
  end

  def submission_for?(candidate)
    Advising.find_by(candidate: candidate, peer: peer, poll: poll).present?
  end

  def percent_complete
    if candidates.count > 0
      submission_count * 100 / candidates.count
    else
      0
    end
  end
  
  private
  def set_seed
      self.seed = rand(5000)
  end
  
end
