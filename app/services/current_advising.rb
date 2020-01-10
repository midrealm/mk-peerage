class CurrentAdvising
  extend Forwardable
  def_delegators :@advising, :date, :judgement_name, :comment
  def initialize(peer:, candidate:)
    @advising = Advising.where(candidate: candidate, peer: peer).find_by(poll: Poll.current(candidate.order))
  end
  def exists?
    !@advising.nil?
  end
end
