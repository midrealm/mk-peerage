class Ballot

  attr_reader :peer
  attr_reader :poll
  attr_reader :candidates
  def initialize(peer)
    raise ArgumentError.new("No Current Poll for Peerage") if Poll.current(peer.order).nil?
    @peer = peer
    @poll = Poll.current(peer.order)
    @candidates = Candidate.where(peerage_type: @peer.order)
  end 

  def complete?
    @candidates.each do |cand|
      if @poll.advisings.find_by(peer: @peer, candidate: cand, submitted: true).nil?
        return false
      end
    end
    return true
  end

  def submission_count
    @poll.advisings.where(peer: @peer, submitted: true).count 
  end

  def submission_for?(candidate)
    Advising.find_by(candidate: candidate, peer: @peer, poll: @poll, submitted: true).present?
  end

  def percent_complete
    if @candidates.count > 0
      submission_count * 100 / @candidates.count
    else
      0
    end
  end
end
