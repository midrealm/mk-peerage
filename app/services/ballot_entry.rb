class BallotEntry

  attr_reader :candidate, :advising, :peer, :poll
  def initialize(peer:, candidate:)
    raise ArgumentError.new("candidate and peer orders don't match") if candidate.order != peer.order
    raise ArgumentError.new("No Current Poll for Candidate's Peerage") if Poll.current(candidate.order).nil?
    @peer = peer
    @candidate = candidate
    @poll = Poll.current(candidate.order)
    @advising = AdvisingPresenter.new(Advising.find_or_initialize_by(candidate: @candidate, poll: @poll, peer: @peer))
    @old_advisings = OldAdvisings.new(candidate: @candidate, peer: @peer)
  end 

  def old_advisings?
    @old_advisings.any?
  end

  def old_advisings
    @old_advisings.advisings
  end

  def judgements
    if @candidate.vote?
      Advising.vote_list_judgements
    else
      Advising.watch_list_judgements
    end
  end

  
end


class AdvisingPresenter
	include ActiveModel::Model
  extend Forwardable
  def_delegators :@advising, :judgement_name, :judgement, :poll
  def initialize(advising)
    @advising = advising
  end
  def comment
    @advising.comment || ''
  end
end
