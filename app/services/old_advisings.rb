class OldAdvisings
  def initialize(peer:, candidate:)
    @peer = peer
    @candidate = candidate
    @current_poll = Poll.current(@candidate.order)
  end
  def advisings
    Advising.where(candidate: @candidate, peer: @peer).where.not(poll: @current_poll).joins(:poll).merge(Poll.order(end_date: :desc))
  end
  def any?
    !advisings.empty?
  end
end
