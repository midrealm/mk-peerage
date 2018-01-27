class BallotEntry

  attr_reader :peer
  attr_reader :poll
  attr_reader :candidate
  def initialize(peer:, candidate:)
    raise ArgumentError.new("candidate and peer orders don't match") if candidate.order != peer.order
    raise ArgumentError.new("No Current Poll for Candidate's Peerage") if Poll.current(candidate.order).nil?
    @peer = peer
    @candidate = candidate
    @poll = Poll.current(candidate.order)
  end 

  def advising
    if Advising.find_by(candidate: @candidate, poll: @poll, peer: @peer).present?
      Advising.find_by(candidate: @candidate, poll: @poll, peer: @peer) 
    elsif Advising.find_by(candidate: @candidate, poll_id: nil, peer: @peer).present?
      nil_advising = Advising.find_by(candidate: @candidate, poll_id: nil, peer: @peer)
      nil_advising.update(poll: @poll)
      nil_advising
    elsif Advising.where(candidate: @candidate, peer: @peer).last.present?
      old_advising =  Advising.where(candidate: @candidate, peer: @peer).last
      Advising.create do |adv|
        adv.poll = @poll
        adv.candidate = @candidate
        adv.peer = @peer
        adv.comment = old_advising.comment
        adv.judgement = old_advising.judgement
      end 
    else
      Advising.create(poll: @poll, peer: @peer, candidate: @candidate) 
    end
  end
end
